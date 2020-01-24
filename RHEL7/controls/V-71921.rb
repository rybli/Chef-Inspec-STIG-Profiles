# encoding: utf-8
#

# TODO use the same attrib from V-71919 - make me an attrib

control "V-71921" do
  title "The shadow file must be configured to store only encrypted
representations of passwords."
  desc  "Passwords need to be protected at all times, and encryption is the
standard method for protecting passwords. If passwords are not encrypted, they
can be plainly read (i.e., clear text) and easily compromised. Passwords
encrypted with a weak algorithm are no more protected than if they are kept in
plain text."
  impact 0.5
  tag "check": "Verify the system's shadow file is configured to store only
encrypted representations of passwords. The strength of encryption that must be
used to hash passwords for all accounts is SHA512.

Check that the system is configured to create SHA512 hashed passwords with the
following command:

# grep -i encrypt /etc/login.defs
ENCRYPT_METHOD SHA512

If the \"/etc/login.defs\" configuration file does not exist or allows for
password hashes other than SHA512 to be used, this is a finding."
  tag "fix": "Configure the operating system to store only SHA512 encrypted
representations of passwords.

Add or update the following line in \"/etc/login.defs\":

ENCRYPT_METHOD SHA512"
  describe login_defs do
    its('ENCRYPT_METHOD') { should cmp "SHA512" }
  end
end
