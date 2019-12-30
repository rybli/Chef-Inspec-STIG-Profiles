# encoding: utf-8
#
control "V-81021" do
  title "The Red Hat Enterprise Linux operating system must label all off-loaded audit logs before sending them to the central log server."
  desc  "Information stored in one location is vulnerable to accidental or incidental deletion or alteration.

Off-loading is a common process in information systems with limited audit storage capacity.

When audit logs are not labeled before they are sent to a central log server, the audit data will not be able to be analyzed and tied back to the correct system.
"
  impact 0.5
  tag "check": "Verify the audisp daemon is configured to label all off-loaded audit logs:

# grep \"name_format\" /etc/audisp/audispd.conf

name_format = hostname

If the \"name_format\" option is not \"hostname\", \"fqd\", or \"numeric\", or the line is commented out, this is a finding."
  tag "fix": "Edit the /etc/audisp/audispd.conf file and add or update the \"name_format\" option:

name_format = hostname

The audit daemon must be restarted for changes to take effect:

# service auditd restart"

   describe file('/etc/audisp/audisp.conf') do
     its('content') { should match %r{^name_format.*=.*(?|(fqdn)|(hostname)|(numeric))$} }
   end
end
