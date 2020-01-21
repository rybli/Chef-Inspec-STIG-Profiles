# encoding: utf-8
#
control "V-72191" do
  title "All uses of the insmod command must be audited."
  desc  "
    Without generating audit records that are specific to the security and
mission needs of the organization, it would be difficult to establish,
correlate, and investigate the events relating to an incident or identify those
responsible for one.

    Audit records can be generated from various components within the
information system (e.g., module or policy filter).
  "
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"insmod\" command occur.

Check the auditing rules in \"/etc/audit/audit.rules\" with the following
command:

# grep -i insmod /etc/audit/audit.rules

If the command does not return the following output this is a finding.

-w /sbin/insmod -p x -F auid!=4294967295 -k module-change

If the command does not return any output, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"insmod\" command occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-w /sbin/insmod -p x -F auid!=4294967295 -k module-change

The audit daemon must be restarted for the changes to take effect."

  audit_file = '/sbin/insmod'

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
