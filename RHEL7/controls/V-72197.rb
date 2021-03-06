# encoding: utf-8
#
control "V-72197" do
  title "The operating system must generate audit records for all account
creations, modifications, disabling, and termination events that affect
/etc/passwd."
  desc  "
    Without generating audit records that are specific to the security and
mission needs of the organization, it would be difficult to establish,
correlate, and investigate the events relating to an incident or identify those
responsible for one.

    Audit records can be generated from various components within the
information system (e.g., module or policy filter).
  "
  tag "check": "Verify the operating system must generate audit records for all
account creations, modifications, disabling, and termination events that affect
\"/etc/passwd\".

Check the auditing rules in \"/etc/audit/audit.rules\" with the following
command:

# grep /etc/passwd /etc/audit/audit.rules

-w /etc/passwd -p wa -k identity

If the command does not return a line, or the line is commented out, this is a
finding."
  tag "fix": "Configure the operating system to generate audit records for all
account creations, modifications, disabling, and termination events that affect
\"/etc/passwd\".

Add or update the following rule \"/etc/audit/rules.d/audit.rules\":

-w /etc/passwd -p wa -k identity

The audit daemon must be restarted for the changes to take effect."

  audit_file = '/etc/passwd'

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
