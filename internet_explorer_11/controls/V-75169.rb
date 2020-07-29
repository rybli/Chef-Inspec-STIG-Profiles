# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-75169 - VBScript must not be allowed to run in Internet Explorer (Internet zone).'
control 'V-75169' do
  impact 0.5
  title 'VBScript must not be allowed to run in Internet Explorer (Internet zone).'
  desc 'This policy setting allows the management of whether VBScript can be run on pages 
  from the specified zone in Internet Explorer. By selecting "Enable" in the drop-down box, 
  VBScript can run without user intervention. By selecting "Prompt" in the drop-down box, 
  users are asked to choose whether to allow VBScript to run. By selecting "Disable" in 
  the drop-down box, VBScript is prevented from running. If this policy setting is not 
  configured or disabled, VBScript will run without user intervention.'
  tag 'stig', 'V-75169'
  tag severity: 'medium'
  tag checkid: ''
  tag fixid: ''
  tag version: 'DTBI1125-IE11'
  tag ruleid: 'SV-89849r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> 
  Internet Zone >> "Allow VBScript to run in Internet Explorer" to "Enabled" and 
  select "Disable" from the drop-down box.'
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> 
  Internet Zone >> "Allow VBScript to run in Internet Explorer" must be "Enabled", 
  and "Disable" must be selected from the drop-down box. 

Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3

If the value for "140C" is not REG_DWORD = 3, this is a finding.

Note: This policy setting will only exist on Windows 10 Redstone 2 or later, and is 
otherwise not applicable.'

# START_DESCRIBE V-75169
  
   describe registry_key('HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3') do
        its('140C') { should eq 3 }
   end

# STOP_DESCRIBE V-75169

end