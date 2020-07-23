# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46695 - Websites in less privileged web content zones must be prevented from navigating into the Restricted Sites zone.'
control 'V-46695' do
  impact 0.5
  title 'Websites in less privileged web content zones must be prevented from navigating into the Restricted Sites zone.'
  desc 'This policy setting allows you to manage whether websites from less privileged zones, such as Restricted Sites, can navigate into the Restricted zone. If this policy setting is enabled, websites from less privileged zones can open new windows in, or navigate into, this zone. The security zone will run without the added layer of security that is provided by the Protection from Zone Elevation security feature. If Prompt is selected in the drop-down box, a warning is issued to the user that potentially risky navigation is about to occur. If this policy setting is disabled, the potentially risky navigation is prevented. The Internet Explorer security feature will be on in this zone as set by the Protection from Zone Elevation feature control. If this policy setting is not configured, websites from less privileged zones can open new windows in, or navigate into, this zone.'
  tag 'stig', 'V-46695'
  tag severity: 'medium'
  tag checkid: 'C-49845r2_chk'
  tag fixid: 'F-50457r1_fix'
  tag version: 'DTBI520-IE11'
  tag ruleid: 'SV-59559r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Web sites in less privileged Web content zones can navigate into this zone to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Web sites in less privileged Web content zones can navigate into this zone must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "2101" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46695
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2101') { should eq 3 }
      end

# STOP_DESCRIBE V-46695

end

