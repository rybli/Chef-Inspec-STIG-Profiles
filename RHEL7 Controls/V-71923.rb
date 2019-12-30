# encoding: utf-8
#

# TODO make me an attrib - use the same one from V-71919,V-71921 etc.

control "V-71923" do
  title "User and group account administration utilities must be configured to
store only encrypted representations of passwords."
  desc  "Passwords need to be protected at all times, and encryption is the
standard method for protecting passwords. If passwords are not encrypted, they
can be plainly read (i.e., clear text) and easily compromised. Passwords
encrypted with a weak algorithm are no more protected than if they are kept in
plain text."
  impact 0.5
  tag "check": "Verify the user and group account administration utilities are
configured to store only encrypted representations of passwords. The strength
of encryption that must be used to hash passwords for all accounts is
\"SHA512\".

Check that the system is configured to create \"SHA512\" hashed passwords with
the following command:

# cat /etc/libuser.conf | grep -i sha512

crypt_style = sha512

If the \"crypt_style\" variable is not set to \"sha512\", is not in the
defaults section, or does not exist, this is a finding."
  tag "fix": "Configure the operating system to store only SHA512 encrypted
representations of passwords.

Add or update the following line in \"/etc/libuser.conf\" in the [defaults]
section:

crypt_style = sha512"
  describe command("cat /etc/libuser.conf | grep -i sha512") do
    its('stdout.strip') { should match %r(^crypt_style = sha512$) }
  end
end
