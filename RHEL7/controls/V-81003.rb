# encoding: utf-8
#
control 'V-81003' do
  title 'The Red Hat Enterprise Linux operating system must be configured so that /etc/pam.d/passwd implements /etc/pam.d/system-auth when changing passwords.'
  desc  'Pluggable authentication modules (PAM) allow for a modular approach to integrating authentication methods. PAM operates in a top-down processing model and if the modules are not listed in the correct order, an important security function could be bypassed if stack entries are not centralized.'
  impact 0.5
  tag 'check': 'Verify that /etc/pam.d/passwd is configured to use /etc/pam.d/system-auth when changing passwords:

# cat /etc/pam.d/passwd | grep -i substack | grep -i system-auth
password substack system-auth

If no results are returned, the line is commented out, this is a finding.'
  tag 'fix': 'Configure PAM to utilize /etc/pam.d/system-auth when changing passwords.

Add the following line to "/etc/pam.d/passwd" (or modify the line to have the required value):

password substack system-auth'

   describe file('/etc/pam.d/passwd') do
     its('content') { should match(%r{^password.substack.system-auth$}) }
   end
end
