# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46515 - Navigating windows and frames across different domains must be disallowed (Internet zone).'
control 'V-46515' do
  impact 0.5
  title 'Navigating windows and frames across different domains must be disallowed (Internet zone).'
  desc 'Frames that navigate across different domains are a security concern, because the user may think they are accessing pages on one site while they are actually accessing pages on another site. It is possible that a website hosting malicious content could use this feature in a manner similar to cross-site scripting (XSS). This policy setting allows you to manage the opening of sub-frames and access of applications across different domains.'
  tag 'stig', 'V-46515'
  tag severity: 'medium'
  tag checkid: 'C-49705r2_chk'
  tag fixid: 'F-50305r1_fix'
  tag version: 'DTBI039-IE11'
  tag ruleid: 'SV-59379r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Navigate windows and frames across different domains to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Navigate windows and frames across different domains must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\InternetSettings\Zones\3 Criteria: If the value "1607" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46515
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\InternetSettings\Zones\3',
      }) do
        its('1607') { should eq 3 }
      end

# STOP_DESCRIBE V-46515

end

