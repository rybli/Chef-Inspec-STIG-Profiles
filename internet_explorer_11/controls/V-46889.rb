# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46889 - Security Warning for unsafe files must be disallowed (Restricted Sites zone).'
control 'V-46889' do
  impact 0.5
  title 'Security Warning for unsafe files must be disallowed (Restricted Sites zone).'
  desc 'This policy setting controls whether or not the Open File - Security Warning message appears when the user tries to open executable files or other potentially unsafe files (from an intranet file shared by using Windows Explorer, for example). If you enable this policy setting and set the drop-down box to "Enable", these files open without a security warning. If you set the drop-down box to "Prompt", a security warning appears before the files open. If you disable this policy these files do not open. If you do not configure this policy setting, the user can configure how the computer handles these files.'
  tag 'stig', 'V-46889'
  tag severity: 'medium'
  tag checkid: 'C-49947r2_chk'
  tag fixid: 'F-50625r1_fix'
  tag version: 'DTBI870-IE11'
  tag ruleid: 'SV-59755r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Show security warning for potentially unsafe files to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Show security warning for potentially unsafe files must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1806" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46889
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1806') { should eq 3 }
      end

# STOP_DESCRIBE V-46889

end

