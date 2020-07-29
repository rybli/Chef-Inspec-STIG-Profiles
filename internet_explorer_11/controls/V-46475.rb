# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46475 - The Internet Explorer warning about certificate address mismatch must be enforced.'
control 'V-46475' do
  impact 0.5
  title 'The Internet Explorer warning about certificate address mismatch must be enforced.'
  desc 'This parameter warns users if the certificate being presented by the website is invalid. 
  Since server certificates are used to validate the identity of the web server it is 
  critical to warn the user of a potential issue with the certificate being presented by the 
  web server. This setting aids to prevent spoofing attacks.'
  tag 'stig', 'V-46475'
  tag severity: 'medium'
  tag checkid: 'C-49685r2_chk'
  tag fixid: 'F-50265r1_fix'
  tag version: 'DTBI015-IE11'
  tag ruleid: 'SV-59339r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Internet Control Panel -> 
  Security Page Turn on certificate address mismatch warning to "Enabled".'
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Internet Control Panel -> 
  Security Page Turn on certificate address mismatch warning must be Enabled. 
  
  Procedure: Use the Windows Registry Editor to navigate to the following key: 
  HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings Criteria: 
  
  If the value "WarnOnBadCertRecving" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46475
  
      describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings') do
        its('WarnOnBadCertRecving') { should eq 1 }
      end

# STOP_DESCRIBE V-46475

end

