# encoding: utf-8
#

# TODO update to use the KNOWN_EXEPTION_USERS and KNOWN_SYSTEM_USERS attributes

control "V-71931" do
  title "Existing passwords must be restricted to a 60-day maximum lifetime."
  desc  "Any password, no matter how complex, can eventually be cracked.
Therefore, passwords need to be changed periodically. If the operating system
does not limit the lifetime of passwords and force users to change their
passwords, there is the risk that the operating system passwords could be
compromised."
  impact 0.5
  tag "check": "Check whether the maximum time period for existing passwords is
restricted to 60 days.

# awk -F: '$5 > 60 {print $1}' /etc/shadow

If any results are returned that are not associated with a system account, this
is a finding."
  tag "fix": "Configure non-compliant accounts to enforce a 60-day maximum
password lifetime restriction.

# chage -M 60 [user]"
  shadow.users.each do |user|
    # filtering on non-system accounts (uid >= 1000)
    next unless user(user).uid >= 1000
    describe shadow.users(user) do
      its('max_days.first.to_i') { should cmp <= 60 }
    end
  end
end
