# encoding: utf-8
#
control "V-72147" do
  title "The operating system must generate audit records for all successful
account access events."
  desc  "
    Without generating audit records that are specific to the security and
mission needs of the organization, it would be difficult to establish,
correlate, and investigate the events relating to an incident or identify those
responsible for one.

    Audit records can be generated from various components within the
information system (e.g., module or policy filter).
  "
  tag "check": "Verify the operating system generates audit records when successful
account access events occur.

Check the file system rules in \"/etc/audit/audit.rules\" with the following
commands:

# grep -i /var/log/lastlog /etc/audit/audit.rules

-w /var/log/lastlog -p wa -k logins

If the command does not return any output, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful account access events occur.

Add or update the following rule in \"/etc/audit/rules.d/audit.rules\":

-w /var/log/lastlog -p wa -k logins

The audit daemon must be restarted for the changes to take effect."
  tag "fix_id": "F-78499r3_fix"

  audit_file = '/var/log/lastlog'

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
      it { should include 'w' }
      it { should include 'a' }
    end
  end if file(audit_file).exist?

  describe "The #{audit_file} file does not exist" do
    skip "The #{audit_file} file does not exist, this requirement is Not Applicable."
  end if !file(audit_file).exist?
end
