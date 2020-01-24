# encoding: utf-8
#
control "V-72299" do
  title "A File Transfer Protocol (FTP) server package must not be installed
unless needed."
  desc  "The FTP service provides an unencrypted remote access that does not
provide for the confidentiality and integrity of user passwords or the remote
session. If a privileged user were to log on using this service, the privileged
user password could be compromised. SSH or other encrypted file transfer
methods must be used in place of this service."
  impact 0.7
  tag "check": "Verify an FTP server has not been installed on the system.

Check to see if an FTP server has been installed with the following commands:

# yum list installed vsftpd

 vsftpd-3.0.2.el7.x86_64.rpm

If \"vsftpd\" is installed and is not documented with the Information System
Security Officer (ISSO) as an operational requirement, this is a finding.
"
  tag "fix": "Document the \"vsftpd\" package with the ISSO as an operational
requirement or remove it from the system with the following command:

# yum remove vsftpd
"

  describe.one do
    describe package('vsftpd') do
      it { should_not be_installed }
    end
    describe parse_config_file('/etc/vsftpd/vsftpd.conf') do
      its('ssl_enable') { should cmp 'YES' }
      its('force_anon_data_ssl') { should cmp 'YES' }
      its('force_anon_logins_ssl') { should cmp 'YES' }
      its('force_local_data_ssl') { should cmp 'YES' }
      its('force_local_logins_ssl') { should cmp 'YES' }
    end
  end
end
