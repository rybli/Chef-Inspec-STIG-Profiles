# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46999 - Anti-Malware programs against ActiveX controls must be run for the Intranet zone.'
control 'V-46999' do
  impact 0.5
  title 'Anti-Malware programs against ActiveX controls must be run for the Intranet zone.'
  desc 'This policy setting determines whether Internet Explorer runs Anti-Malware programs against ActiveX controls, to check if theyre safe to load on pages.      If you enable this policy setting, Internet Explorer wont check with your Anti-Malware program to see if its safe to create an instance of the ActiveX control. If you disable this policy setting, Internet Explorer always checks with your Anti-Malware program to see if its safe to create an instance of the ActiveX control. If you dont configure this policy setting, Internet Explorer wont check with your Anti-Malware program to see if its safe to create an instance of the ActiveX control. Users can turn this behavior on or off, using Internet Explorer Security settings.'
  tag 'stig', 'V-46999'
  tag severity: 'medium'
  tag checkid: 'C-49983r2_chk'
  tag fixid: 'F-50719r1_fix'
  tag version: 'DTBI062-IE11'
  tag ruleid: 'SV-59865r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel -> Security Page -> Intranet Zone Dont run antimalware programs against ActiveX controls to Enabled and select Disable in the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel -> Security Page -> Intranet Zone Dont run antimalware programs against ActiveX controls must be Enabled and Disable selected in the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1  Criteria: If the value "270C" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46999
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1',
      }) do
        its('270C') { should eq 0 }
      end

# STOP_DESCRIBE V-46999

end

