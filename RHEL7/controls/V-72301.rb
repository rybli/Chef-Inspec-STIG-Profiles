# encoding: utf-8
#
control "V-72301" do
  title "The Trivial File Transfer Protocol (TFTP) server package must not be
installed if not required for operational support."
  desc  "If TFTP is required for operational support (such as the transmission
of router configurations) its use must be documented with the Information
System Security Officer (ISSO), restricted to only authorized personnel, and
have access control rules established."
  impact 0.7
  tag "check": "Verify a TFTP server has not been installed on the system.

Check to see if a TFTP server has been installed with the following command:

# yum list installed tftp-server
tftp-server-0.49-9.el7.x86_64.rpm

If TFTP is installed and the requirement for TFTP is not documented with the
ISSO, this is a finding."
  tag "fix": "Remove the TFTP package from the system with the following
command:

# yum remove tftp"

  describe package('tftp-server') do
    it { should_not be_installed }
  end
end
