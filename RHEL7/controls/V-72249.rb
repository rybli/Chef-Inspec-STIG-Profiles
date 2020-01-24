# encoding: utf-8
#
control "V-72249" do
  title "The SSH daemon must not allow authentication using known hosts
authentication."
  desc  "Configuring this setting for the SSH daemon provides additional
assurance that remote logon via SSH will require a password, even in the event
of misconfiguration elsewhere."
  impact 0.5
  tag "check": "Verify the SSH daemon does not allow authentication using known
hosts authentication.

To determine how the SSH daemon's \"IgnoreUserKnownHosts\" option is set, run
the following command:

# grep -i IgnoreUserKnownHosts /etc/ssh/sshd_config

IgnoreUserKnownHosts yes

If the value is returned as \"no\", the returned line is commented out, or no
output is returned, this is a finding."
  tag "fix": "Configure the SSH daemon to not allow authentication using known
hosts authentication.

Add the following line in \"/etc/ssh/sshd_config\", or uncomment the line and
set the value to \"yes\":

IgnoreUserKnownHosts yes

The SSH service must be restarted for changes to take effect."

  describe sshd_config do
    its('IgnoreUserKnownHosts') { should cmp 'yes' }
  end
end
