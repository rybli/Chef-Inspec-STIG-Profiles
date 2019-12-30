# encoding: utf-8
#
control "V-72171" do
  title "All uses of the mount command must be audited."
  desc  "
    Reconstruction of harmful events or forensic analysis is not possible if
audit records do not contain enough information.

    At a minimum, the organization must audit the full-text recording of
privileged mount commands. The organization must maintain audit trails in
sufficient detail to reconstruct events to determine the cause and impact of
compromise.
  "
  impact 0.5
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"mount\" command occur.

Check for the following system calls being audited by performing the following
series of commands to check the file system rules in
\"/etc/audit/audit.rules\":

# grep -iw \"mount\" /etc/audit/audit.rules

-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b32 -F path=/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b32 -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -F path=/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

If all uses of the mount command are not being audited, this is a finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"mount\" command occur.

Add or update the following rules in \"/etc/audit/rules.d/audit.rules\":

Note: The rules are duplicated to cover both 32-bit and 64-bit architectures.
Only the lines appropriate for the system architecture must be configured.

-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b32 -F path=/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b32 -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -F path=/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

-a always,exit -F arch=b64 -F path=/usr/bin/mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount

The audit daemon must be restarted for the changes to take effect."

  describe auditd.syscall("mount").where {arch == "b32"} do
    its('action.uniq') { should eq ['always'] }
    its('list.uniq') { should eq ['exit'] }
  end
  describe auditd.path("/bin/mount").where {arch == "b32"} do
    its('action.uniq') { should eq ['always'] }
    its('list.uniq') { should eq ['exit'] }
  end
  describe auditd.path("/usr/bin/mount").where {arch == "b32"} do
    its('action.uniq') { should eq ['always'] }
    its('list.uniq') { should eq ['exit'] }
  end

  if os.arch == 'x86_64'
    describe auditd.syscall("mount").where {arch == "b64"} do
      its('action.uniq') { should eq ['always'] }
      its('list.uniq') { should eq ['exit'] }
    end
    describe auditd.path("/bin/mount").where {arch == "b64"} do
      its('action.uniq') { should eq ['always'] }
      its('list.uniq') { should eq ['exit'] }
    end
    describe auditd.path("/usr/bin/mount").where {arch == "b64"} do
      its('action.uniq') { should eq ['always'] }
      its('list.uniq') { should eq ['exit'] }
    end
  end
end
