# encoding: utf-8
#
control "V-71947" do
  title "Users must provide a password for privilege escalation."
  desc  "
    Without re-authentication, users may access resources or perform tasks for
which they do not have authorization.

    When operating systems provide the capability to escalate a functional
capability, it is critical the user re-authenticate.
  "
  impact 0.5
  tag "check": "If passwords are not being used for authentication, this is Not
Applicable.

Verify the operating system requires users to supply a password for privilege
escalation.

Check the configuration of the \"/etc/sudoers\" and \"/etc/sudoers.d/*\" files
with the following command:

# grep -i nopasswd /etc/sudoers /etc/sudoers.d/*

If any uncommented line is found with a \"NOPASSWD\" tag, this is a finding."
  tag "fix": "Configure the operating system to require users to supply a
password for privilege escalation.

Check the configuration of the \"/etc/sudoers\" and \"/etc/sudoers.d/*\" files
with the following command:

# grep -i nopasswd /etc/sudoers /etc/sudoers.d/*

Remove any occurrences of \"NOPASSWD\" tags in the file."

  processed = []
  to_process = ['/etc/sudoers', '/etc/sudoers.d']

  while !to_process.empty?
    in_process = to_process.pop
    next if processed.include? in_process
    processed.push in_process

    if file(in_process).directory?
      to_process.concat(
        command("find #{in_process} -maxdepth 1 -mindepth 1").
          stdout.strip.split("\n").
          select { |f| file(f).file? }
      )
    elsif file(in_process).file?
      to_process.concat(
        command("grep -E '#include\\s+' #{in_process} | sed 's/.*#include[[:space:]]*//g'").
          stdout.strip.split("\n").
          map { |f| f.start_with?('/') ? f : File.join(File.dirname(in_process), f) }.
          select { |f| file(f).exist? }
      )
      to_process.concat(
        command("grep -E '#includedir\\s+' #{in_process} | sed 's/.*#includedir[[:space:]]*//g'").
          stdout.strip.split("\n").
          map { |f| f.start_with?('/') ? f : File.join(File.dirname(in_process), f) }.
          select { |f| file(f).exist? }
      )
    end
  end

  sudoers = processed.select { |f| file(f).file? }

  sudoers.each do |sudoer|
    describe command("grep -i nopasswd #{sudoer}") do
      its('stdout') { should_not match %r{^[^#]*NOPASSWD} }
    end
  end
end
