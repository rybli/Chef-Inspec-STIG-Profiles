# encoding: utf-8
#
control "V-81017" do
  title "The Red Hat Enterprise Linux operating system must configure the au-remote plugin to off-load audit logs using the audisp-remote daemon."
  desc  "Information stored in one location is vulnerable to accidental or incidental deletion or alteration.

Off-loading is a common process in information systems with limited audit storage capacity.

Without the configuration of the \"au-remote\" plugin, the audisp-remote daemon will not off load the logs from the system being audited."
  impact 0.5
  tag "check": "Verify the \"au-remote\" plugin is configured to always off-load audit logs using the audisp-remote daemon:

# cat /etc/audisp/plugins.d/au-remote.conf | grep -v \"^#\"

active = yes
direction = out
path = /sbin/audisp-remote
type = always
format = string

If the \"direction\" setting is not set to \"out\", or the line is commented out, this is a finding.

If the \"path\" setting is not set to \"/sbin/audisp-remote\", or the line is commented out, this is a finding.

If the \"type\" setting is not set to \"always\", or the line is commented out, this is a finding."
  tag "fix": 'Edit the /etc/audisp/plugins.d/au-remote.conf file and add or update the following values:

direction = out
path = /sbin/audisp-remote
type = always

The audit daemon must be restarted for changes to take effect:

# service auditd restart'

   describe file ('/etc/audisp/plugins.d/au-remote.conf') do
     its('content') { should match(%r{^direction.*=.*out$}) }
     its('content') { should match(%r{^path.*=.*\/audisp-remote$}) }
     its('content') { should match(%r{^type.*=.*always$}) }
   end
end
