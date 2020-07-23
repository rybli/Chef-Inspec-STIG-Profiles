# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46577 - The Initialize and script ActiveX controls not marked as safe property must be disallowed (Restricted Sites zone).'
control 'V-46577' do
  impact 0.5
  title 'The Initialize and script ActiveX controls not marked as safe property must be disallowed (Restricted Sites zone).'
  desc 'ActiveX controls not marked safe for scripting should not be executed. Although this is not a complete security measure for a control to be marked safe for scripting, if a control is not marked safe, it should not be initialized and executed.'
  tag 'stig', 'V-46577'
  tag severity: 'medium'
  tag checkid: 'C-49743r2_chk'
  tag fixid: 'F-50347r1_fix'
  tag version: 'DTBI114-IE11'
  tag ruleid: 'SV-59441r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Initialize and script ActiveX controls not marked as safe to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Initialize and script ActiveX controls not marked as safe must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1201" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46577
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1201') { should eq 3 }
      end

# STOP_DESCRIBE V-46577

end

