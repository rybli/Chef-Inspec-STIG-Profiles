# encoding: utf-8
#
control "V-72095" do
  title "AThe Red Hat Enterprise Linux operating system must audit all executions of privileged functions."
  desc  "Misuse of privileged functions, either intentionally or
unintentionally by authorized users, or by unauthorized external entities that
have compromised information system accounts, is a serious and ongoing concern
and can have significant adverse impacts on organizations. Auditing the use of
privileged functions is one way to detect such misuse and identify the risk
from insider threats and the advanced persistent threat."
  impact 0.5
  tag "check": "Verify the operating system audits the execution of privileged functions using the following command:

# grep -iw execve /etc/audit/audit.rules

-a always,exit -F arch=b32 -S execve -C uid!=euid -F euid=0 -k setuid
-a always,exit -F arch=b64 -S execve -C uid!=euid -F euid=0 -k setuid
-a always,exit -F arch=b32 -S execve -C gid!=egid -F egid=0 -k setgid
-a always,exit -F arch=b64 -S execve -C gid!=egid -F egid=0 -k setgid


If both the 'b32' and 'b64' audit rules for 'SUID' files are not defined, this is a finding.

If both the 'b32' and 'b64' audit rules for 'SGID' files are not defined, this is a finding."
  tag "fix": "Configure the operating system to audit the execution of privileged functions.

Add or update the following rules in '/etc/audit/rules.d/audit.rules':

-a always,exit -F arch=b32 -S execve -C uid!=euid -F euid=0 -k setuid
-a always,exit -F arch=b64 -S execve -C uid!=euid -F euid=0 -k setuid
-a always,exit -F arch=b32 -S execve -C gid!=egid -F egid=0 -k setgid
-a always,exit -F arch=b64 -S execve -C gid!=egid -F egid=0 -k setgid

The audit daemon must be restarted for the changes to take effect."

  describe auditd do
    its('lines') { should include %r(-a always,exit -F arch=b32 -S execve -C uid!=euid -F euid=0 -k setuid) }
    its('lines') { should include %r(-a always,exit -F arch=b64 -S execve -C uid!=euid -F euid=0 -k setuid) }
    its('lines') { should include %r(-a always,exit -F arch=b32 -S execve -C gid!=egid -F egid=0 -k setgid) }
    its('lines') { should include %r(-a always,exit -F arch=b64 -S execve -C gid!=egid -F egid=0 -k setgid) }
  end
end
