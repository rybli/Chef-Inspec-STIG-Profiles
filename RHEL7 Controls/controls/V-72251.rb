# encoding: utf-8
#
control "V-72251" do
  title "The SSH daemon must be configured to only use the SSHv2 protocol."
  desc  "SSHv1 is an insecure implementation of the SSH protocol and has many
well-known vulnerability exploits. Exploits of the SSH daemon could provide
immediate root access to the system."
  impact 0.7
  tag "check": "Check the version of the operating system with the following
command:

# cat /etc/redhat-release

If the release is 7.4 or newer this requirement is Not Applicable.

Verify the SSH daemon is configured to only use the SSHv2 protocol.

Check that the SSH daemon is configured to only use the SSHv2 protocol with the
following command:

# grep -i protocol /etc/ssh/sshd_config
Protocol 2
#Protocol 1,2

If any protocol line other than \"Protocol 2\" is uncommented, this is a
finding."
  tag "fix": "Remove all Protocol lines that reference version \"1\" in
\"/etc/ssh/sshd_config\" (this file may be named differently or be in a
different location if using a version of SSH that is provided by a third-party
vendor). The \"Protocol\" line must be as follows:

Protocol 2

The SSH service must be restarted for changes to take effect."

  if os.release.to_f >= 7.4
    impact 0.0
    describe "The release is #{os.release}" do
      skip "The release is newer than 7.4; this control is Not Applicable."
    end
  else
    describe sshd_config do
      its('Protocol') { should cmp '2' }
    end
  end
end
