# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46801 - Scripting of Java applets must be disallowed (Restricted Sites zone).'
control 'V-46801' do
  impact 0.5
  title 'Scripting of Java applets must be disallowed (Restricted Sites zone).'
  desc 'This policy setting allows you to manage whether applets are exposed to scripts within the zone. If you enable this policy setting, scripts can access applets automatically without user intervention. If you select "Prompt" in the drop-down box, users are queried to choose whether to allow scripts to access applets. If you disable this policy setting, scripts are prevented from accessing applets. If you do not configure this policy setting, scripts can access applets automatically without user intervention. '
  tag 'stig', 'V-46801'
  tag severity: 'medium'
  tag checkid: 'C-49893r2_chk'
  tag fixid: 'F-50551r1_fix'
  tag version: 'DTBI670-IE11'
  tag ruleid: 'SV-59667r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Scripting of Java applets to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Scripting of Java applets must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1402" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46801
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1402') { should eq 3 }
      end

# STOP_DESCRIBE V-46801

end

