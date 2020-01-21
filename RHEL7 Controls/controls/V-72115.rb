# encoding: utf-8
#
control "V-72115" do
  title "The Red Hat Enterprise Linux operating system must audit all uses of the lsetxattr syscall."
  desc  "Without generating audit records that are specific to the security and mission needs of the organization, it would be difficult to establish, correlate, and investigate the events relating to an incident or identify those responsible for one.

Audit records can be generated from various components within the information system (e.g., module or policy filter)."
  impact 0.5
  tag "check": "Verify the operating system generates audit records when successful/unsuccessful attempts to use the 'lsetxattr' syscall occur.

Check the file system rules in '/etc/audit/audit.rules' with the following commands:

# grep -iw lsetxattr /etc/audit/audit.rules

-a always,exit -F arch=b32 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod

-a always,exit -F arch=b64 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod

If both the 'b32' and 'b64' audit rules are not defined for the 'lsetxattr' syscall, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when successful/unsuccessful attempts to use the 'lsetxattr' syscall occur.

Add or update the following rules in '/etc/audit/rules.d/audit.rules':

-a always,exit -F arch=b32 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod

-a always,exit -F arch=b64 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod

The audit daemon must be restarted for the changes to take effect."


  describe auditd do
    its('lines') { should include %r(-a always,exit -F arch=b32 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod) }
    its('lines') { should include %r(-a always,exit -F arch=b64 -S lsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod) }
  end

  # describe auditd.syscall("lsetxattr").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  # end
  # if os.arch == 'x86_64'
  #   describe auditd.syscall("lsetxattr").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #   end
  # end
end
