# encoding: utf-8
#
control 'V-81015' do
  title 'The Red Hat Enterprise Linux operating system must be configured to use the au-remote plugin.'
  desc  'Information stored in one location is vulnerable to accidental or incidental deletion or alteration.

Off-loading is a common process in information systems with limited audit storage capacity.

Without the configuration of the "au-remote" plugin, the audisp-remote daemon will not off-load the logs from the system being audited.
'
  impact 0.5
  tag 'check': 'Verify the "au-remote" plugin is active on the system:

# grep "active" /etc/audisp/plugins.d/au-remote.conf

active = yes

If the "active" setting is not set to "yes", or the line is commented out, this is a finding.'
  tag 'fix': 'Edit the /etc/audisp/plugins.d/au-remote.conf file and change the value of "active" to "yes".

The audit daemon must be restarted for changes to take effect:

# service auditd restart'

  describe file('/etc/audisp/plugins/au-remote.conf') do
    its('content') { should match(%r{^active.*=.*yes$}) }
  end
end
