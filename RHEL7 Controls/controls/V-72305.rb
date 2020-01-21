# encoding: utf-8
#
control "V-72305" do
  title "If the Trivial File Transfer Protocol (TFTP) server is required, the
TFTP daemon must be configured to operate in secure mode."
  desc  "Restricting TFTP to a specific directory prevents remote users from
copying, transferring, or overwriting system files."
  if package('tftp-server').installed?
    impact 0.5
  else
    impact 0.0
  end
  tag "check": "Verify the TFTP daemon is configured to operate in secure mode.

Check to see if a TFTP server has been installed with the following commands:

# yum list installed | grep tftp-server
tftp-server.x86_64    x.x-x.el7    rhel-7-server-rpms

If a TFTP server is not installed, this is Not Applicable.

If a TFTP server is installed, check for the server arguments with the
following command:

# grep server_args /etc/xinetd.d/tftp
server_args = -s /var/lib/tftpboot

If the \"server_args\" line does not have a \"-s\" option and a subdirectory is
not assigned, this is a finding."
  tag "fix": "Configure the TFTP daemon to operate in secure mode by adding the
following line to \"/etc/xinetd.d/tftp\" (or modify the line to have the
required value):

server_args = -s /var/lib/tftpboot"

  if package('tftp-server').installed?
    describe command('grep server_args /etc/xinetd.d/tftp') do
      its('stdout.strip') { should match %r{^\s*server_args\s+=\s+(-s|--secure)\s(\/\S+)$} }
    end
  else
    describe "The TFTP package is not installed" do
      skip "If a TFTP server is not installed, this is Not Applicable."
    end
  end
end
