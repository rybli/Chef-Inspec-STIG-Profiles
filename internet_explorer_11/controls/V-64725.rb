# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64725 - The Initialize and script ActiveX controls not marked as safe must be disallowed (Trusted Sites Zone).'
control 'V-64725' do
  impact 0.5
  title 'The Initialize and script ActiveX controls not marked as safe must be disallowed (Trusted Sites Zone).'
  desc 'ActiveX controls that are not marked safe for scripting should not be executed. Although this is not a complete security measure for a control to be marked safe for scripting, if a control is not marked safe, it should not be initialized and executed. This setting causes both unsafe and safe controls to be initialized and scripted, ignoring the Script ActiveX controls marked safe for scripting option. This increases the risk of malicious code being loaded and executed by the browser. If you enable this policy setting, ActiveX controls are run, loaded with parameters and scripted without setting object safety for untrusted data or scripts. If you disable this policy setting, ActiveX controls that cannot be made safe are not loaded with parameters or scripted. This setting is not recommended, except for secure and administered zones.'
  tag 'stig', 'V-64725'
  tag severity: 'medium'
  tag checkid: 'C-65467r2_chk'
  tag fixid: 'F-70655r1_fix'
  tag version: 'DTBI1095-IE11'
  tag ruleid: 'SV-79215r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> Trusted Sites Zone >> ”Initialize and script ActiveX controls not marked as safe” to ”Enabled”, and select ”Disable” from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> Trusted Sites Zone >> ”Initialize and script ActiveX controls not marked as safe” must be ”Enabled” and ”Disable” selected from the drop-down box. 

Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2. 

Criteria: If the value "1201" is REG_DWORD = 3, this is not a finding.
'

# START_DESCRIBE V-64725
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2',
      }) do
        its('1201') { should eq 3 }
      end

# STOP_DESCRIBE V-64725

end

