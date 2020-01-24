# encoding: utf-8
#
control "V-72217" do
  title "The Red Hat Enterprise Linux operating system must limit the number of concurrent sessions to 10 for all accounts and/or account types."
  desc  "Operating system management includes the ability to control the number of users and user sessions that utilize an operating system. Limiting the number of allowed users and sessions per user is helpful in reducing the risks related to DoS attacks.

This requirement addresses concurrent sessions for information system accounts and does not address concurrent sessions by single users via multiple system accounts. The maximum number of concurrent sessions should be defined based on mission needs and the operational environment for each system."
  impact 0.3
  tag "check": "Verify the operating system limits the number of concurrent sessions to '10' for all accounts and/or account types by issuing the following command:

# grep 'maxlogins' /etc/security/limits.conf /etc/security/limits.d/*.conf

* hard maxlogins 10

This can be set as a global domain (with the * wildcard) but may be set differently for multiple domains.

If the 'maxlogins' item is missing, commented out, or the value is not set to '10' or less for all domains that have the 'maxlogins' item assigned, this is a finding."
  tag "fix": "Configure the operating system to limit the number of concurrent sessions to '10' for all accounts and/or account types.

Add the following line to the top of the /etc/security/limits.conf or in a '.conf' file defined in /etc/security/limits.d/ :

* hard maxlogins 10"

  describe limits_conf('/etc/security/limits.conf') do
    its('*') { should include ["hard", "maxlogins", "10"] }
  end
end
