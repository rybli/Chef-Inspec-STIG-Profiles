# encoding: utf-8
#
control "V-78999" do
  title "The Red Hat Enterprise Linux operating system must audit all uses of the create_module syscall."
  desc  "Without generating audit records that are specific to the security and mission needs of the organization, it would be difficult to establish, correlate, and investigate the events relating to an incident or identify those responsible for one.

Audit records can be generated from various components within the information system (e.g., module or policy filter)."
  impact 0.5
  tag "check": "Verify the operating system generates audit records when successful/unsuccessful attempts to use the 'create_module' syscall occur.

Check the auditing rules in '/etc/audit/audit.rules' with the following command:

# grep -iw create_module /etc/audit/audit.rules

-a always,exit -F arch=b32 -S create_module -k module-change

-a always,exit -F arch=b64 -S create_module -k module-change

If both the 'b32' and 'b64' audit rules are not defined for the 'create_module' syscall, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when successful/unsuccessful attempts to use the 'create_module' syscall occur.

Add or update the following rules in '/etc/audit/rules.d/audit.rules':

-a always,exit -F arch=b32 -S create_module -k module-change

-a always,exit -F arch=b64 -S create_module -k module-change

The audit daemon must be restarted for the changes to take effect."

describe auditd do
  its('lines') { should include %r(-a always,exit -F arch=b32 -S create_module -k module-change) }
  its('lines') { should include %r(-a always,exit -F arch=b64 -S create_module -k module-change) }
end

  # describe auditd.syscall("create_module").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  # end
  # if os.arch == 'x86_64'
  #   describe auditd.syscall("create_module").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #   end
  # end

end
