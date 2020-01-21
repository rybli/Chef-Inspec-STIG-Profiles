# encoding: utf-8
#
control "V-72173" do
  title "All uses of the umount command must be audited."
  desc  "
    Reconstruction of harmful events or forensic analysis is not possible if
audit records do not contain enough information.

    At a minimum, the organization must audit the full-text recording of
privileged mount commands. The organization must maintain audit trails in
sufficient detail to reconstruct events to determine the cause and impact of
compromise.
  "
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"umount\" command occur.

Check for the following system calls being audited by performing the following
series of commands to check the file system rules in
\"/etc/audit/audit.rules\":

# grep -i \"/bin/umount\" /etc/audit/audit.rules

-a always,exit -F path=/bin/umount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-mount

If the command does not return any output, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"umount\" command occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-a always,exit -F path=/bin/umount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-mount

The audit daemon must be restarted for the changes to take effect."

  audit_file = '/bin/umount'

  if file(audit_file).exist?
    impact 0.5
  else
    impact 0.0
  end

  describe auditd.file(audit_file) do
    its('permissions') { should_not cmp [] }
    its('action') { should_not include 'never' }
  end if file(audit_file).exist?

  # Resource creates data structure including all usages of file
  perms = auditd.file(audit_file).permissions

  perms.each do |perm|
    describe perm do
      it { should include 'x' }
    end
  end if file(audit_file).exist?

  describe "The #{audit_file} file does not exist" do
    skip "The #{audit_file} file does not exist, this requirement is Not Applicable."
  end if !file(audit_file).exist?
end
