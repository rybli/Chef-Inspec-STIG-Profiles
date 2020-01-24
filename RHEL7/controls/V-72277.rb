# encoding: utf-8
#
control "V-72277" do
  title "There must be no .shosts files on the system."
  desc  "The .shosts files are used to configure host-based authentication for
individual users or the system via SSH. Host-based authentication is not
sufficient for preventing unauthorized access to the system, as it does not
require interactive identification and authentication of a connection request,
or for the use of two-factor authentication."
  impact 0.7
  tag "check": "Verify there are no \".shosts\" files on the system.

Check the system for the existence of these files with the following command:

# find / -name '*.shosts'

If any \".shosts\" files are found on the system, this is a finding."
  tag "fix": "Remove any found \".shosts\" files from the system.

# rm /[path]/[to]/[file]/.shosts"
  tag "dangerous": { :reason => "Uses global find command" }

  describe command("find / -xautofs -name '*.shosts'") do
    its('stdout.strip') { should be_empty }
  end
end
