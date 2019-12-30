# encoding: utf-8
#
control "V-72203" do
  title "All uses of the rmdir command must be audited."
  desc  "If the system is not configured to audit certain activities and write
them to an audit log, it is more difficult to detect and track system
compromises and damages incurred during a system compromise."
  impact 0.5
  tag "check": "Verify the operating system generates audit records when
successful/unsuccessful attempts to use the \"rmdir\" command occur.

Check the file system rules in \"/etc/audit/audit.rules\" with the following
commands:

Note: The output lines of the command are duplicated to cover both 32-bit and
64-bit architectures. Only the lines appropriate for the system architecture
must be present.

# grep -iw rmdir /etc/audit/audit.rules

-a always,exit -F arch=b32 -S rmdir -F perm=x -F auid>=1000 -F auid!=4294967295 -k delete

-a always,exit -F arch=b64 -S rmdir -F perm=x -F auid>=1000 -F auid!=4294967295 -k delete

If there are no audit rules defined for the \"rmdir\" command, this is a
finding."
  tag "fix": "Configure the operating system to generate audit records when
successful/unsuccessful attempts to use the \"rmdir\" command occur.

Add the following rules in \"/etc/audit/rules.d/audit.rules\":

Note: The rules are duplicated to cover both 32-bit and 64-bit architectures.
Only the lines appropriate for the system architecture must be configured.

-a always,exit -F arch=b32 -S rmdir -F perm=x -F auid>=1000 -F auid!=4294967295 -k delete

-a always,exit -F arch=b64 -S rmdir -F perm=x -F auid>=1000 -F auid!=4294967295 -k delete

The audit daemon must be restarted for the changes to take effect."

  describe auditd.syscall("rmdir").where {arch == "b32"} do
    its('action.uniq') { should eq ['always'] }
    its('list.uniq') { should eq ['exit'] }
  end
  if os.arch == 'x86_64'
    describe auditd.syscall("rmdir").where {arch == "b64"} do
      its('action.uniq') { should eq ['always'] }
      its('list.uniq') { should eq ['exit'] }
    end
  end
end
