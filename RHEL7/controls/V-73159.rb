# encoding: utf-8
#
control "V-73159" do
  title "When passwords are changed or new passwords are established, pwquality
must be used."
  desc  "Use of a complex password helps to increase the time and resources
required to compromise the password. Password complexity, or strength, is a
measure of the effectiveness of a password in resisting attempts at guessing
and brute-force attacks. \"pwquality\" enforces complex password construction
configuration and has the ability to limit brute-force attacks on the system."
  impact 0.5
  tag "check": "Verify the operating system uses \"pwquality\" to enforce the
password complexity rules.

Check for the use of \"pwquality\" with the following command:

#  cat /etc/pam.d/passwd | grep pam_pwquality

password required pam_pwquality.so retry=3

If the command does not return a line containing the value
\"pam_pwquality.so\", this is a finding.

If the value of \"retry\" is set to \"0\" or greater than \"3\", this is a finding."
  tag "fix": "Configure the operating system to use \"pwquality\" to enforce
password complexity rules.

Add the following line to \"/etc/pam.d/passwd\" (or modify the line to have the
required value):

password    required    pam_pwquality.so retry=3

Note: The value of \"retry\" should be between \"1\" and \"3\"."

  describe pam('/etc/pam.d/passwd') do
    its('lines') { should match_pam_rule('password (required|requisite) pam_pwquality.so') }
    its('lines') { should match_pam_rule('password (required|requisite) pam_pwquality.so').all_with_integer_arg('retry', '>=', 1) }
    its('lines') { should match_pam_rule('password (required|requisite) pam_pwquality.so').all_with_integer_arg('retry', '<=', 3) }
  end
end
