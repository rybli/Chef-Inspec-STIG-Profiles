# encoding: utf-8
#
control "V-73163" do
  title "The audit system must take appropriate action when there is an error
sending audit records to a remote system."
  desc  "Taking appropriate action when there is an error sending audit records
to a remote system will minimize the possibility of losing audit records."
  impact 0.5
  tag "check": 'Verify the action the operating system takes if there is an error sending audit records to a remote system.

Check the action that takes place if there is an error sending audit records to a remote system with the following command:

# grep -i network_failure_action /etc/audisp/audisp-remote.conf
network_failure_action = syslog

If the value of the "network_failure_action" option is not "syslog", "single", or "halt", or the line is commented out, this is a finding.'
  tag "fix": 'Configure the action the operating system takes if there is an error sending audit records to a remote system.

Uncomment the "network_failure_action" option in "/etc/audisp/audisp-remote.conf" and set it to "syslog", "single", or "halt".

network_failure_action = syslog'

#Test matches the test for ./inspec-profiles/controls/V-72087.rb
  describe parse_config_file('/etc/audisp/audisp-remote.conf') do
    its('network_failure_action.strip') { should match %r{^(syslog|single|halt)$} }
  end
end
