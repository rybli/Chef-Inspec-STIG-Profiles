# encoding: utf-8
#
control "V-72259" do
  title "The SSH daemon must not permit Generic Security Service Application
Program Interface (GSSAPI) authentication unless needed."
  desc  "GSSAPI authentication is used to provide additional authentication
mechanisms to applications. Allowing GSSAPI authentication through SSH exposes
the system’s GSSAPI to remote hosts, increasing the attack surface of the
system. GSSAPI authentication must be disabled unless needed."
  impact 0.5
  tag "check": "Verify the SSH daemon does not permit GSSAPI authentication
unless approved.

Check that the SSH daemon does not permit GSSAPI authentication with the
following command:

# grep -i gssapiauth /etc/ssh/sshd_config
GSSAPIAuthentication no

If the \"GSSAPIAuthentication\" keyword is missing, is set to \"yes\" and is
not documented with the Information System Security Officer (ISSO), or the
returned line is commented out, this is a finding."
  tag "fix": "Uncomment the \"GSSAPIAuthentication\" keyword in
\"/etc/ssh/sshd_config\" (this file may be named differently or be in a
different location if using a version of SSH that is provided by a third-party
vendor) and set the value to \"no\":

GSSAPIAuthentication no

The SSH service must be restarted for changes to take effect.

If GSSAPI authentication is required, it must be documented, to include the
location of the configuration file, with the ISSO."

  describe sshd_config do
    its('GSSAPIAuthentication') { should cmp 'no' }
  end
end
