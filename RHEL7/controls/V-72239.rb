# encoding: utf-8
#
control "V-72239" do
  title "The SSH daemon must not allow authentication using RSA rhosts
authentication."
  desc  "Configuring this setting for the SSH daemon provides additional
assurance that remote logon via SSH will require a password, even in the event
of misconfiguration elsewhere."
  impact 0.5
  tag "check": "Verify the SSH daemon does not allow authentication using RSA
rhosts authentication.

To determine how the SSH daemon's \"RhostsRSAAuthentication\" option is set,
run the following command:

# grep RhostsRSAAuthentication /etc/ssh/sshd_config
RhostsRSAAuthentication no

If the value is returned as \"yes\", the returned line is commented out, or no
output is returned, this is a finding."
  tag "fix": "Configure the SSH daemon to not allow authentication using RSA
rhosts authentication.

Add the following line in \"/etc/ssh/sshd_config\", or uncomment the line and
set the value to \"no\":

RhostsRSAAuthentication no

The SSH service must be restarted for changes to take effect."

  describe sshd_config do
    its('RhostsRSAAuthentication') { should cmp 'no' }
  end
end
