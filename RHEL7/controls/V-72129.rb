# encoding: utf-8
#
control "V-72129" do
  title "The Red Hat Enterprise Linux operating system must audit all uses of the open_by_handle_at syscall."
  desc  "Without generating audit records that are specific to the security and mission needs of the organization, it would be difficult to establish, correlate, and investigate the events relating to an incident or identify those responsible for one.

Audit records can be generated from various components within the information system (e.g., module or policy filter)."
  impact 0.5
  tag "check": "Verify the operating system generates audit records when successful/unsuccessful attempts to use the 'open_by_handle_at' syscall occur.

Check the file system rules in '/etc/audit/audit.rules' with the following commands:

# grep -iw open_by_handle_at /etc/audit/audit.rules

-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access

If both the 'b32' and 'b64' audit rules are not defined for the 'open_by_handle_at' syscall, this is a finding.

If the output does not produce rules containing '-F exit=-EPERM', this is a finding.

If the output does not produce rules containing '-F exit=-EACCES', this is a finding."
  tag "fix": "Configure the operating system to generate audit records when successful/unsuccessful attempts to use the 'open_by_handle_at' syscall occur.

Add or update the following rules in '/etc/audit/rules.d/audit.rules':

-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access

-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access

The audit daemon must be restarted for the changes to take effect."

describe auditd do
  its('lines') { should include %r(-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access) }
  its('lines') { should include %r(-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access) }
  its('lines') { should include %r(-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access) }
  its('lines') { should include %r(-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access) }
end

  # describe auditd.syscall("open_by_handle_at").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  #   its('exit.uniq') { should include '-EPERM' }
  # end
  # describe auditd.syscall("open_by_handle_at").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  #   its('exit.uniq') { should include '-EACCES' }
  # end
  # if os.arch == 'x86_64'
  #   describe auditd.syscall("open_by_handle_at").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #     its('exit.uniq') { should include '-EPERM' }
  #   end
  #   describe auditd.syscall("open_by_handle_at").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #     its('exit.uniq') { should include '-EACCES' }
  #   end
  # end
end
