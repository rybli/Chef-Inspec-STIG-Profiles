# encoding: utf-8
#
control "V-72163" do
  title "All uses of the sudoers command must be audited."
  desc  "
    Reconstruction of harmful events or forensic analysis is not possible if
audit records do not contain enough information.

    At a minimum, the organization must audit the full-text recording of
privileged access commands. The organization must maintain audit trails in
sufficient detail to reconstruct events to determine the cause and impact of
compromise.
  "
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"sudoer\" command occur.

Check for modification of the following files being audited by performing the
following commands to check the file system rules in
\"/etc/audit/audit.rules\":

# grep -i \"/etc/sudoers\" /etc/audit/audit.rules

-w /etc/sudoers -p wa -k privileged-actions

# grep -i \"/etc/sudoers.d/\" /etc/audit/audit.rules

-w /etc/sudoers.d/ -p wa -k privileged-actions

If the commands do not return output that does not match the examples, this is
a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"sudoer\" command occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-w /etc/sudoers -p wa -k privileged-actions

-w /etc/sudoers.d/ -p wa -k privileged-actions

The audit daemon must be restarted for the changes to take effect."

  audit_files = ['/etc/sudoers', '/etc/sudoers.d']

  if audit_files.any? { |audit_file| file(audit_file).exist? }
    impact 0.5
  else
    impact 0.0
  end

  audit_files.each do |audit_file|
    describe auditd.file(audit_file) do
      its('permissions') { should_not cmp [] }
      its('action') { should_not include 'never' }
    end if file(audit_file).exist?

    # Resource creates data structure including all usages of file
    perms = auditd.file(audit_file).permissions

    perms.each do |perm|
      describe perm do
        it { should include 'w' }
        it { should include 'a' }
      end
    end if file(audit_file).exist?
  end

  describe "The #{audit_files} files do not exist" do
    skip "The #{audit_files} files do not exist, this requirement is Not Applicable."
  end if !audit_files.any? { |audit_file| file(audit_file).exist? }
end
