# encoding: utf-8
#
control "V-72303" do
  title "Remote X connections for interactive users must be encrypted."
  desc  "Open X displays allow an attacker to capture keystrokes and execute
commands remotely."
  impact 0.7
  tag "check": "Verify remote X connections for interactive users are encrypted.

Check that remote X connections are encrypted with the following command:

# grep -i x11forwarding /etc/ssh/sshd_config

X11Forwarding yes

If the \"X11Forwarding\" keyword is set to \"no\", is missing, or is commented
out, this is a finding."
  tag "fix": "Configure SSH to encrypt connections for interactive users.

Edit the \"/etc/ssh/sshd_config\" file to uncomment or add the line for the
\"X11Forwarding\" keyword and set its value to \"yes\" (this file may be named
differently or be in a different location if using a version of SSH that is
provided by a third-party vendor):

X11Forwarding yes

The SSH service must be restarted for changes to take effect."

  describe sshd_config do
    its('X11Forwarding') { should cmp 'yes' }
  end
end
