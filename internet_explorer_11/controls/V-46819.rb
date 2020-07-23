# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46819 - Managing SmartScreen Filter use must be enforced.'
control 'V-46819' do
  impact 0.5
  title 'Managing SmartScreen Filter use must be enforced.'
  desc 'This setting is important from a security perspective because Microsoft has extensive data 
  illustrating the positive impact the SmartScreen filter has had on reducing the risk of malware 
  infection via visiting malicious websites. This policy setting allows users to enable the 
  SmartScreen Filter, which will warn if the website being visited is known for fraudulent 
  attempts to gather personal information through phishing or is known to host malware. If you 
  enable this setting the user will not be prompted to enable the SmartScreen Filter. It must be 
  specified which mode the SmartScreen Filter uses: On or Off. If the feature is On, all website 
  addresses not contained on the filters allow list, will be sent automatically to Microsoft 
  without prompting the user. If this feature is set to Off, the feature will not run. If you 
  disable or do not configure this policy setting, the user is prompted to decide whether to 
  turn on SmartScreen Filter during the first-run experience.'
  tag 'stig', 'V-46819'
  tag severity: 'medium'
  tag checkid: 'C-49907r7_chk'
  tag fixid: 'F-50565r4_fix'
  tag version: 'DTBI740-IE11'
  tag ruleid: 'SV-59685r3_rule'
  tag fixtext: 'If the system is on the SIPRNet, this requirement is NA.

Set the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> 
Internet Explorer >> "Prevent Managing SmartScreen Filter" to "Enabled", and select "On" from 
the drop-down box.'
  tag checktext: 'If the system is on the SIPRNet, this requirement is NA.

The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> 
Internet Explorer >> "Prevent Managing SmartScreen Filter" must be "Enabled", and "On" selected 
from the drop-down box. 

Procedure: Use the Windows Registry Editor to navigate to the following key:
HKLM\Software\Policies\Microsoft\Internet Explorer\PhishingFilter 

Criteria: If the value "EnabledV9" is "REG_DWORD = 1", this is not a finding.'

# START_DESCRIBE V-46819
  
  describe registry_key('HKLM\Software\Policies\Microsoft\Internet Explorer\PhishingFilter') do
    its('EnabledV9') { should eq 1 }
  end

# STOP_DESCRIBE V-46819

end

