# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46599 - Navigating windows and frames across different domains must be disallowed (Restricted Sites zone).'
control 'V-46599' do
  impact 0.5
  title 'Navigating windows and frames across different domains must be disallowed (Restricted Sites zone).'
  desc 'Frames navigating across different domains are a security concern, because the user may think they are accessing pages on one site while they are actually accessing pages on another site. It is possible that a website hosting malicious content could use this feature in a manner similar to cross-site scripting (XSS). This policy setting allows you to manage the opening of sub-frames and access of applications across different domains.'
  tag 'stig', 'V-46599'
  tag severity: 'medium'
  tag checkid: 'C-49765r2_chk'
  tag fixid: 'F-50369r1_fix'
  tag version: 'DTBI129-IE11'
  tag ruleid: 'SV-59463r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Navigate windows and frames across different domains to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Navigate windows and frames across different domains must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1607" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46599
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1607') { should eq 3 }
      end

# STOP_DESCRIBE V-46599

end

