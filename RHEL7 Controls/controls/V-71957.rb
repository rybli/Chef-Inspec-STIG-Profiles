# encoding: utf-8
#
control "V-71957" do
  title "The operating system must not allow users to override SSH environment
variables."
  desc  "Failure to restrict system access to authenticated users negatively
impacts operating system security."
  impact 0.5
  tag "check": "Verify the operating system does not allow users to override
environment variables to the SSH daemon.

Check for the value of the \"PermitUserEnvironment\" keyword with the following
command:

# grep -i permituserenvironment /etc/ssh/sshd_config
PermitUserEnvironment no

If the \"PermitUserEnvironment\" keyword is not set to \"no\", is missing, or
is commented out, this is a finding."
  tag "fix": "Configure the operating system to not allow users to override
environment variables to the SSH daemon.

Edit the \"/etc/ssh/sshd_config\" file to uncomment or add the line for
\"PermitUserEnvironment\" keyword and set the value to \"no\":

PermitUserEnvironment no

The SSH service must be restarted for changes to take effect."
  # the `i` will ignore case
  describe sshd_config do
    its('PermitUserEnvironment') { should eq 'no' }
  end
end
