# encoding: utf-8
#
control "V-72157" do
  title "All uses of the userhelper command must be audited."
  desc  "
    Reconstruction of harmful events or forensic analysis is not possible if
audit records do not contain enough information.

    At a minimum, the organization must audit the full-text recording of
privileged password commands. The organization must maintain audit trails in
sufficient detail to reconstruct events to determine the cause and impact of
compromise.
  "
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"userhelper\" command occur.

Check the file system rule in \"/etc/audit/audit.rules\" with the following
command:

# grep -i /usr/sbin/userhelper /etc/audit/audit.rules

-a always,exit -F path=/usr/sbin/userhelper -F perm=x -F auid>=1000 -F
auid!=4294967295 -k privileged-passwd

If the command does not return any output, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"userhelper\" command occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-a always,exit -F path=/usr/sbin/userhelper -F perm=x -F auid>=1000 -F
auid!=4294967295 -k privileged-passwd

The audit daemon must be restarted for the changes to take effect."

  audit_file = '/usr/sbin/userhelper'

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
