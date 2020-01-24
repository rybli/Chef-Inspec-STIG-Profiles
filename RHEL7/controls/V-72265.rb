# encoding: utf-8
#
control "V-72265" do
  title "The SSH daemon must use privilege separation."
  desc  "SSH daemon privilege separation causes the SSH process to drop root
privileges when not needed, which would decrease the impact of software
vulnerabilities in the unprivileged section."
  impact 0.5
  tag "check": "Verify the SSH daemon performs privilege separation.

Check that the SSH daemon performs privilege separation with the following
command:

# grep -i usepriv /etc/ssh/sshd_config

UsePrivilegeSeparation sandbox

If the \"UsePrivilegeSeparation\" keyword is set to \"no\", is missing, or the
retuned line is commented out, this is a finding."
  tag "fix": "Uncomment the \"UsePrivilegeSeparation\" keyword in
\"/etc/ssh/sshd_config\" (this file may be named differently or be in a
different location if using a version of SSH that is provided by a third-party
vendor) and set the value to \"sandbox\" or \"yes\":

UsePrivilegeSeparation sandbox

The SSH service must be restarted for changes to take effect."

  describe.one do
    describe sshd_config do
      its('UsePrivilegeSeparation') { should cmp 'sandbox' }
    end
    describe sshd_config do
      its('UsePrivilegeSeparation') { should cmp 'yes' }
    end
  end
end
