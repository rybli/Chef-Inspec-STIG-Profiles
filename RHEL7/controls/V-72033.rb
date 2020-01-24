# encoding: utf-8
#

exempt_home_users = attribute(
  'exempt_home_users',
  description: 'These are `home dir` exempt interactive accounts',
  value: []
)

non_interactive_shells = attribute(
  'non_interactive_shells',
  description: 'These shells do not allow a user to login',
  value: ["/sbin/nologin","/sbin/halt","/sbin/shutdown","/bin/false","/bin/sync", "/bin/true"]
)

control "V-72033" do
  title "The Red Hat Enterprise Linux operating system must be configured so that all local initialization files have mode 0740 or less permissive."
  desc  "Local initialization files are used to configure the user's shell environment upon logon. Malicious modification of these files could compromise accounts upon logon."
  impact 0.5
  tag "check": "Verify that all local initialization files have a mode of '0740' or less permissive.

Check the mode on all local initialization files with the following command:

Note: The example will be for the 'smithj' user, who has a home directory of '/home/smithj'.

# ls -al /home/smithj/.[^.]* | more

-rwxr----- 1 smithj users 896 Mar 10 2011 .profile
-rwxr----- 1 smithj users 497 Jan 6 2007 .login
-rwxr----- 1 smithj users 886 Jan 6 2007 .something

If any local initialization files have a mode more permissive than '0740', this is a finding."
  tag "fix": "Set the mode of the local initialization files to '0740' with the following command:

Note: The example will be for the 'smithj' user, who has a home directory of '/home/smithj'.

# chmod 0740 /home/smithj/.[^.]*"

  ignore_shells = non_interactive_shells.join('|')

  findings = Set[]
  users.where{ !shell.match(ignore_shells) && (uid >= 1000 || uid == 0)}.entries.each do |user_info|
    findings = findings + command("find #{user_info.home} -xdev -maxdepth 1 -name '.*' -type f -perm /037").stdout.split("\n")
  end
  describe findings do
    it { should be_empty }
  end
end
