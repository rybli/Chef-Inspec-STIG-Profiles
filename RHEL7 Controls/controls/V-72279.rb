# encoding: utf-8
#
control "V-72279" do
  title "There must be no shosts.equiv files on the system."
  desc  "The shosts.equiv files are used to configure host-based authentication
for the system via SSH. Host-based authentication is not sufficient for
preventing unauthorized access to the system, as it does not require
interactive identification and authentication of a connection request, or for
the use of two-factor authentication."
  impact 0.7
  tag "check": "Verify there are no \"shosts.equiv\" files on the system.

Check the system for the existence of these files with the following command:

# find / -name shosts.equiv

If any \"shosts.equiv\" files are found on the system, this is a finding."
  tag "fix": "Remove any found \"shosts.equiv\" files from the system.

# rm /[path]/[to]/[file]/shosts.equiv"
  tag "dangerous": { :reason => "Uses global find command" }

  describe command('find / -xautofs -name shosts.equiv') do
    its('stdout.strip') { should be_empty }
  end
end
