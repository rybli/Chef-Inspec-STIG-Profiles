# encoding: utf-8
#
control "V-72185" do
  title "All uses of the pam_timestamp_check command must be audited."
  desc  "Without generating audit records that are specific to the security and
mission needs of the organization, it would be difficult to establish,
correlate, and investigate the events relating to an incident or identify those
responsible for one."
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"pam_timestamp_check\" command
occur.

Check the auditing rules in \"/etc/audit/audit.rules\" with the following
command:

# grep -i \"/sbin/pam_timestamp_check\" /etc/audit/audit.rules

-a always,exit -F path=/sbin/pam_timestamp_check -F perm=x -F auid>=1000 -F auid!=4294967295  -k privileged-pam

If the command does not return any output, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"pam_timestamp_check\" command
occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-a always,exit -F path=/sbin/pam_timestamp_check -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-pam

The audit daemon must be restarted for the changes to take effect."

  audit_file = '/sbin/pam_timestamp_check'

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
