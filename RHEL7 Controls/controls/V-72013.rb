# encoding: utf-8
#
control "V-72013" do
  title "All local interactive user accounts, upon creation, must be assigned a
home directory."
  desc  "If local interactive users are not assigned a valid home directory,
there is no place for the storage and control of files they should own."
  impact 0.5
  tag "check": "Verify all local interactive users on the system are assigned a
home directory upon creation.

Check to see if the system is configured to create home directories for local
interactive users with the following command:

# grep -i create_home /etc/login.defs
CREATE_HOME yes

If the value for \"CREATE_HOME\" parameter is not set to \"yes\", the line is
missing, or the line is commented out, this is a finding."
  tag "fix": "Configure the operating system to assign home directories to all
new local interactive users by setting the \"CREATE_HOME\" parameter in
\"/etc/login.defs\" to \"yes\" as follows.

CREATE_HOME yes"

  describe login_defs do
    its('CREATE_HOME') { should eq 'yes' }
  end
end
