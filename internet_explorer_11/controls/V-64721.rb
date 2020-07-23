# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64721 - Turn on SmartScreen Filter scan option for the Restricted Sites Zone must be enabled.'
control 'V-64721' do
  impact 0.5
  title 'Turn on SmartScreen Filter scan option for the Restricted Sites Zone must be enabled.'
  desc 'This policy setting controls whether SmartScreen Filter scans pages in this zone for malicious content. If you enable this policy setting, SmartScreen Filter scans pages in this zone for malicious content. If you disable this policy setting, SmartScreen Filter does not scan pages in this zone for malicious content. If you do not configure this policy setting, the user can choose whether SmartScreen Filter scans pages in this zone for malicious content.'
  tag 'stig', 'V-64721'
  tag severity: 'medium'
  tag checkid: 'C-65463r2_chk'
  tag fixid: 'F-70651r1_fix'
  tag version: 'DTBI1085-IE11'
  tag ruleid: 'SV-79211r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> Restricted Sites Zone >> ”Turn on SmartScreen Filter scan” to ”Enabled”, and select ”Enable” from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> Restricted Sites Zone >> ”Turn on SmartScreen Filter scan” must be ”Enabled” and ”Enable” selected from the drop-down box. 

Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4. 

Criteria: If the value "2301" is REG_DWORD = 0, this is not a finding.
'

# START_DESCRIBE V-64721
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2301') { should eq 0 }
      end

# STOP_DESCRIBE V-64721

end

