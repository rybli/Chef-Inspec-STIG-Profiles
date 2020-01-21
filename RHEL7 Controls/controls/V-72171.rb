# encoding: utf-8
#
control "V-72171" do
  title "The Red Hat Enterprise Linux operating system must audit all uses of the mount command and syscall."
  desc  "Reconstruction of harmful events or forensic analysis is not possible if audit records do not contain enough information.

At a minimum, the organization must audit the full-text recording of privileged mount commands. The organization must maintain audit trails in sufficient detail to reconstruct events to determine the cause and impact of compromise."
  impact 0.5
  tag "check": "Verify the operating system generates audit records when successful/unsuccessful attempts to use the 'mount' command and syscall occur.

Check that the following system call is being audited by performing the following series of commands to check the file system rules in '/etc/audit/audit.rules':

# grep -iw 'mount' /etc/audit/audit.rules

-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount
-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount
-a always,exit -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

If both the 'b32' and 'b64' audit rules are not defined for the 'mount' syscall, this is a finding.

If all uses of the 'mount' command are not being audited, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when successful/unsuccessful attempts to use the 'mount' command and syscall occur.

Add or update the following rules in '/etc/audit/rules.d/audit.rules':

-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount
-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount
-a always,exit -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

The audit daemon must be restarted for the changes to take effect."

  describe auditd do
    its('lines') { should include %r(-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount) }
    its('lines') { should include %r(-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount) }
    its('lines') { should include %r(-a always,exit -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount) }
  end

  # describe auditd.syscall("mount").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  # end
  # describe auditd.path("/bin/mount").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  # end
  # describe auditd.path("/usr/bin/mount").where {arch == "b32"} do
  #   its('action.uniq') { should eq ['always'] }
  #   its('list.uniq') { should eq ['exit'] }
  # end
  #
  # if os.arch == 'x86_64'
  #   describe auditd.syscall("mount").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #   end
  #   describe auditd.path("/bin/mount").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #   end
  #   describe auditd.path("/usr/bin/mount").where {arch == "b64"} do
  #     its('action.uniq') { should eq ['always'] }
  #     its('list.uniq') { should eq ['exit'] }
  #   end
  # end
end
