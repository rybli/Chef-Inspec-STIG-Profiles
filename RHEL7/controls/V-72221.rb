# encoding: utf-8
#
control "V-72221" do
  title "A FIPS 140-2 approved cryptographic algorithm must be used for SSH
communications."
  desc  "
    Unapproved mechanisms that are used for authentication to the cryptographic
module are not verified and therefore cannot be relied upon to provide
confidentiality or integrity, and DoD data may be compromised.

    Operating systems utilizing encryption are required to use FIPS-compliant
mechanisms for authenticating to cryptographic modules.

    FIPS 140-2 is the current standard for validating that mechanisms used to
access cryptographic modules utilize authentication that meets DoD
requirements. This allows for Security Levels 1, 2, 3, or 4 for use on a
general purpose computing system.
  "
  impact 0.5
  tag "check": "Verify the operating system uses mechanisms meeting the
requirements of applicable federal laws, Executive orders, directives,
policies, regulations, standards, and guidance for authentication to a
cryptographic module.

Note: If RHEL-07-021350 is a finding, this is automatically a finding as the
system cannot implement FIPS 140-2-approved cryptographic algorithms and hashes.

The location of the \"sshd_config\" file may vary if a different daemon is in
use.

Inspect the \"Ciphers\" configuration with the following command:

# grep -i ciphers /etc/ssh/sshd_config
Ciphers aes128-ctr,aes192-ctr,aes256-ctr

If any ciphers other than \"aes128-ctr\", \"aes192-ctr\", or \"aes256-ctr\" are
listed, the \"Ciphers\" keyword is missing, or the retuned line is commented
out, this is a finding."
  tag "fix": "Configure SSH to use FIPS 140-2 approved cryptographic algorithms.

Add the following line (or modify the line to have the required value) to the
\"/etc/ssh/sshd_config\" file (this file may be named differently or be in a
different location if using a version of SSH that is provided by a third-party
vendor).

Ciphers aes128-ctr,aes192-ctr,aes256-ctr

The SSH service must be restarted for changes to take effect."

  @ciphers_array = inspec.sshd_config.params['ciphers']

  unless @ciphers_array.nil?
    @ciphers_array = @ciphers_array.first.split(",")
  end

  describe @ciphers_array do
    it { should be_in ['aes128-ctr', 'aes192-ctr', 'aes256-ctr'] }
  end
end
