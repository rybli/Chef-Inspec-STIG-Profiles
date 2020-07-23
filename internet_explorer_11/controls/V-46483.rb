# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46483 - The Download unsigned ActiveX controls property must be disallowed (Internet zone).'
control 'V-46483' do
  impact 0.5
  title 'The Download unsigned ActiveX controls property must be disallowed (Internet zone).'
  desc 'Unsigned code is potentially harmful, especially when coming from an untrusted zone. This policy setting allows you to manage whether users may download unsigned ActiveX controls from the zone. If you enable this policy setting, users can run unsigned controls without user intervention. If you select "Prompt" in the drop-down box, users are queried to choose whether to allow the unsigned control to run. If you disable this policy setting, users cannot run unsigned controls. If you do not configure this policy setting, users cannot run unsigned controls.'
  tag 'stig', 'V-46483'
  tag severity: 'medium'
  tag checkid: 'C-49691r2_chk'
  tag fixid: 'F-50275r1_fix'
  tag version: 'DTBI023-IE11'
  tag ruleid: 'SV-59347r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Download unsigned ActiveX controls to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Download unsigned ActiveX controls must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "1004" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46483
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1004') { should eq 3 }
      end

# STOP_DESCRIBE V-46483

end

