# encoding: utf-8
#
control "V-77823" do
  title "The operating system must require authentication upon booting into
single-user and maintenance modes."
  desc  "If the system does not require valid root authentication before it
boots into single-user or maintenance mode, anyone who invokes single-user or
maintenance mode is granted privileged access to all files on the system."
  impact 0.5
  tag "check": "Verify the operating system must require authentication upon
booting into single-user and maintenance modes.

Check that the operating system requires authentication upon booting into
single-user mode with the following command:

# grep -i execstart /usr/lib/systemd/system/rescue.service

ExecStart=-/bin/sh -c \"/usr/sbin/sulogin; /usr/bin/systemctl --fail --no-block
default\"

If \"ExecStart\" does not have \"/usr/sbin/sulogin\" as an option, this is a
finding.
"
  tag "fix": "Configure the operating system to require authentication upon
booting into single-user and maintenance modes.

Add or modify the \"ExecStart\" line in
\"/usr/lib/systemd/system/rescue.service\" to include \"/usr/sbin/sulogin\":

ExecStart=-/bin/sh -c \"/usr/sbin/sulogin; /usr/bin/systemctl --fail --no-block
default\"
"

  describe command("grep -i execstart /usr/lib/systemd/system/rescue.service") do
    its('stdout.strip') { should match %r{/usr/sbin/sulogin} }
  end
end
