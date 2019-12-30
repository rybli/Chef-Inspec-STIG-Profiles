# encoding: utf-8
#

unsuccessful_attempts = attribute('unsuccessful_attempts', value: 3,
description: 'The account is denied access after the specified number of
consecutive failed logon attempts.')
fail_interval = attribute('fail_interval', value: 900,
description: 'The interval of time in which the consecutive failed logon
attempts must occur in order for the account to be locked out (in seconds).')
lockout_time = attribute('lockout_time', value: 604800,
description: 'The minimum amount of time that an account must be locked out
after the specified number of unsuccessful logon attempts (in seconds).
This attribute should never be set greater than 604800.')

control "V-71943" do
  title "The Red Hat Enterprise Linux operating system must be configured to lock accounts for a minimum of 15 minutes after three unsuccessful logon attempts within a 15-minute timeframe."
  desc  "By limiting the number of failed logon attempts, the risk of
unauthorized system access via user password guessing, otherwise known as
brute-forcing, is reduced. Limits are imposed by locking the account."
  impact 0.5
  tag "check": 'Check that the system locks an account for a minimum of 15 minutes after three unsuccessful logon attempts within a period of 15 minutes with the following command:

# grep pam_faillock.so /etc/pam.d/password-auth

auth required pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=900
auth [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=900
account required pam_faillock.so

If the "deny" parameter is set to "0" or a value less than "3" on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "even_deny_root" parameter is not set on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "fail_interval" parameter is set to "0" or is set to a value less than "900" on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "unlock_time" parameter is not set to "0", "never", or is set to a value less than "900" on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

Note: The maximum configurable value for "unlock_time" is "604800".

If any line referencing the "pam_faillock.so" module is commented out, this is a finding.

# grep pam_faillock.so /etc/pam.d/system-auth

auth required pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=900
auth [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=900
account required pam_faillock.so

If the "deny" parameter is set to "0" or a value less than "3" on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "even_deny_root" parameter is not set on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "fail_interval" parameter is set to "0" or is set to a value less than "900" on both "auth" lines with the "pam_faillock.so" module, or is missing from these lines, this is a finding.

If the "unlock_time" parameter is not set to "0", "never", or is set to a value less than "900" on both "auth" lines with the "pam_faillock.so" module or is missing from these lines, this is a finding.

Note: The maximum configurable value for "unlock_time" is "604800".
If any line referencing the "pam_faillock.so" module is commented out, this is a finding.'
  tag "fix": "Configure the operating system to lock an account for the maximum
period when three unsuccessful logon attempts in 15 minutes are made.

Modify the first three lines of the auth section of the
\"/etc/pam.d/system-auth-ac\" and \"/etc/pam.d/password-auth-ac\" files to
match the following lines:

auth        required       pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800
auth        sufficient     pam_unix.so try_first_pass
auth        [default=die]  pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800
account required pam_faillock.so"

  required_rules = [
    'auth required pam_faillock.so unlock_time=.*',
    'auth sufficient pam_unix.so try_first_pass',
    'auth [default=die] pam_faillock.so unlock_time=.*'
  ]
  alternate_rules = [
    'auth required pam_faillock.so unlock_time=.*',
    'auth sufficient pam_sss.so forward_pass',
    'auth sufficient pam_unix.so try_first_pass',
    'auth [default=die] pam_faillock.so unlock_time=.*'
  ]

  describe pam('/etc/pam.d/password-auth') do
    its('lines') {
      should match_pam_rules(required_rules).exactly.or \
             match_pam_rules(alternate_rules).exactly
    }
    its('lines') { should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('deny', '<=', unsuccessful_attempts) }
    its('lines') { should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('fail_interval', '<=', fail_interval) }
    its('lines') {
      should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_args('unlock_time=(0|never)').or \
            (match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('unlock_time', '<=', 604800).and \
             match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('unlock_time', '>=', lockout_time))
    }
  end

  describe pam('/etc/pam.d/system-auth') do
    its('lines') {
      should match_pam_rules(required_rules).exactly.or \
             match_pam_rules(alternate_rules).exactly
    }
    its('lines') { should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('deny', '<=', unsuccessful_attempts) }
    its('lines') { should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('fail_interval', '<=', fail_interval) }
    its('lines') {
      should match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_args('unlock_time=(0|never)').or \
            (match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('unlock_time', '<=', 604800).and \
             match_pam_rule('auth [default=die]|required pam_faillock.so').all_with_integer_arg('unlock_time', '>=', lockout_time))
    }
  end
end
