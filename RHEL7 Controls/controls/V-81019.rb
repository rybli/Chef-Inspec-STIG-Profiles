# encoding: utf-8
#
control "V-81019" do
  title "The Red Hat Enterprise Linux operating system must take appropriate action when the audisp-remote buffer is full."
  desc  "Information stored in one location is vulnerable to accidental or incidental deletion or alteration.

Off-loading is a common process in information systems with limited audit storage capacity.

When the remote buffer is full, audit logs will not be collected and sent to the central log server."
  impact 0.5
  tag "check": "Verify the audisp daemon is configured to take an appropriate action when the internal queue is full:

# grep \"overflow_action\" /etc/audisp/audispd.conf

overflow_action = syslog

If the \"overflow_action\" option is not \"syslog\", \"single\", or \"halt\", or the line is commented out, this is a finding.
"
  tag "fix": "Edit the /etc/audisp/audispd.conf file and add or update the \"overflow_action\" option:

overflow_action = syslog

The audit daemon must be restarted for changes to take effect:

# service auditd restart"

  describe file('/etc/audisp/audisp.conf') do
    its('content') { should match %r{^overflow_action.*=.*(?|(single)|(halt)|(syslog))$} }
  end
end
