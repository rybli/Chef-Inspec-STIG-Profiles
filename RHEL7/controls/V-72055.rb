# encoding: utf-8
#
control "V-72055" do
  title "If the cron.allow file exists it must be group-owned by root."
  desc  "If the group owner of the \"cron.allow\" file is not set to root,
sensitive information could be viewed or edited by unauthorized users."
  impact 0.5
  tag "check": "Verify that the \"cron.allow\" file is group-owned by root.

Check the group owner of the \"cron.allow\" file with the following command:

# ls -al /etc/cron.allow
-rw------- 1 root root 6 Mar  5  2011 /etc/cron.allow

If the \"cron.allow\" file exists and has a group owner other than root, this
is a finding."
  tag "fix": "Set the group owner on the \"/etc/cron.allow\" file to root with
the following command:

# chgrp root /etc/cron.allow"

  describe.one do
    # case where file doesn't exist
    describe file('/etc/cron.allow') do
      it { should_not exist }
    end
    # case where file exists
    describe file('/etc/cron.allow') do
      its('group') { should eq 'root' }
    end
  end
end
