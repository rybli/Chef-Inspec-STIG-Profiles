# encoding: utf-8
#
control "V-71903" do
  title "When passwords are changed or new passwords are established, the new
password must contain at least one upper-case character."
  desc  "
    Use of a complex password helps to increase the time and resources required
to compromise the password. Password complexity, or strength, is a measure of
the effectiveness of a password in resisting attempts at guessing and
brute-force attacks.

    Password complexity is one factor of several that determines how long it
takes to crack a password. The more complex the password, the greater the
number of possible combinations that need to be tested before the password is
compromised.
  "
  impact 0.5
  tag "check": "Note: The value to require a number of upper-case characters to
be set is expressed as a negative number in \"/etc/security/pwquality.conf\".

Check the value for \"ucredit\" in \"/etc/security/pwquality.conf\" with the
following command:

# grep ucredit /etc/security/pwquality.conf
ucredit = -1

If the value of \"ucredit\" is not set to a negative value, this is a finding."
  tag "fix": "Configure the operating system to enforce password complexity by
requiring that at least one upper-case character be used by setting the
\"ucredit\" option.

Add the following line to \"/etc/security/pwquality.conf\" (or modify the line
to have the required value):

ucredit = -1"
  describe parse_config_file("/etc/security/pwquality.conf") do
    its('ucredit.to_i') { should cmp < 0 }
  end
end
