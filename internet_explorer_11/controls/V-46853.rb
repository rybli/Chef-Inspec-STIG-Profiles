# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46853 - When uploading files to a server, the local directory path must be excluded (Internet zone).'
control 'V-46853' do
  impact 0.5
  title 'When uploading files to a server, the local directory path must be excluded (Internet zone).'
  desc 'This policy setting controls whether or not the local path information will be sent when uploading a file via a HTML form. If the local path information is sent, some information may be unintentionally revealed to the server. If you do not configure this policy setting, the user can choose whether path information will be sent when uploading a file via a form. By default, path information will be sent.'
  tag 'stig', 'V-46853'
  tag severity: 'medium'
  tag checkid: 'C-49929r2_chk'
  tag fixid: 'F-50589r1_fix'
  tag version: 'DTBI810-IE11'
  tag ruleid: 'SV-59719r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Include local path when user is uploading files to a server to Enabled, and select Disable from the drop-down box.  '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Include local path when user is uploading files to a server must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "160A" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46853
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('160A') { should eq 3 }
      end

# STOP_DESCRIBE V-46853

end

