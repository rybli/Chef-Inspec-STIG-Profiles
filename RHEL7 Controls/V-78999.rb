# encoding: utf-8
#
control "V-78999" do
  title "All uses of the create_module command must be audited."
  desc  "
    Without generating audit records that are specific to the security and
mission needs of the organization, it would be difficult to establish,
correlate, and investigate the events relating to an incident or identify those
responsible for one.

    Audit records can be generated from various components within the
information system (e.g., module or policy filter).
  "
  impact 0.5
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"create_module\" command occur.

Check the auditing rules in \"/etc/audit/audit.rules\" with the following
command:

Note: The output lines of the command are duplicated to cover both 32-bit and
64-bit architectures. Only the line appropriate for the system architecture
must be present.

# grep -iw create_module /etc/audit/audit.rules

If the command does not return the following output (appropriate to the
architecture), this is a finding.

-a always,exit -F arch=b32 -S create_module -k module-change

-a always,exit -F arch=b64 -S create_module -k module-change

If there are no audit rules defined for \"create_module\", this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"create_module\" command occur.

Add or update the following rules in \"/etc/audit/rules.d/audit.rules\":

Note: The rules are duplicated to cover both 32-bit and 64-bit architectures.
Only the lines appropriate for the system architecture must be configured.

-a always,exit -F arch=b32 -S create_module -k module-change

-a always,exit -F arch=b64 -S create_module -k module-change

The audit daemon must be restarted for the changes to take effect."

  describe auditd.syscall("create_module").where {arch == "b32"} do
    its('action.uniq') { should eq ['always'] }
    its('list.uniq') { should eq ['exit'] }
  end
  if os.arch == 'x86_64'
    describe auditd.syscall("create_module").where {arch == "b64"} do
      its('action.uniq') { should eq ['always'] }
      its('list.uniq') { should eq ['exit'] }
    end
  end

end
