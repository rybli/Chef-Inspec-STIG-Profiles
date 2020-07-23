# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46481 - The Download signed ActiveX controls property must be disallowed (Internet zone).'
control 'V-46481' do
  impact 0.5
  title 'The Download signed ActiveX controls property must be disallowed (Internet zone).'
  desc 'Active X controls can contain potentially malicious code and must only be allowed to 
  be downloaded from trusted sites. Signed code is better than unsigned code in that it may 
  be easier to determine its author, but it is still potentially harmful, especially when 
  coming from an untrusted zone. This policy setting allows you to manage whether users 
  may download signed ActiveX controls from a page in the zone. If you enable this policy, 
  users can download signed controls without user intervention. If you select Prompt in the 
  drop-down box, users are queried whether to download controls signed by untrusted publishers. 
  Code signed by trusted publishers is silently downloaded. If you disable the policy setting, 
  signed controls cannot be downloaded.'
  tag 'stig', 'V-46481'
  tag severity: 'medium'
  tag checkid: 'C-49689r2_chk'
  tag fixid: 'F-50271r1_fix'
  tag version: 'DTBI022-IE11'
  tag ruleid: 'SV-59345r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Download signed ActiveX controls to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Download signed ActiveX controls must be Enabled, and Disable selected from the drop-down box.  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "1001" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46481
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1001') { should eq 3 }
      end

# STOP_DESCRIBE V-46481

end

