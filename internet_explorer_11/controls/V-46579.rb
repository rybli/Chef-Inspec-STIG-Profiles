# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46579 - ActiveX controls and plug-ins must be disallowed (Restricted Sites zone).'
control 'V-46579' do
  impact 0.5
  title 'ActiveX controls and plug-ins must be disallowed (Restricted Sites zone).'
  desc 'This policy setting allows you to manage whether ActiveX controls and plug-ins can be run on pages from the specified zone. ActiveX controls not marked as safe should not be executed. If you enable this policy setting, controls and plug-ins can run without user intervention. If you disable this policy setting, controls and plug-ins are prevented from running.'
  tag 'stig', 'V-46579'
  tag severity: 'medium'
  tag checkid: 'C-49745r2_chk'
  tag fixid: 'F-50349r1_fix'
  tag version: 'DTBI115-IE11'
  tag ruleid: 'SV-59443r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Run ActiveX controls and plugins to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Run ActiveX controls and plugins must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1200" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46579
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1200') { should eq 3 }
      end

# STOP_DESCRIBE V-46579

end

