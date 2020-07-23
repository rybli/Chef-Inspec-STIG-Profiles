# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46573 - The Download signed ActiveX controls property must be disallowed (Restricted Sites zone).'
control 'V-46573' do
  impact 0.5
  title 'The Download signed ActiveX controls property must be disallowed (Restricted Sites zone).'
  desc 'ActiveX controls can contain potentially malicious code and must only be allowed to be downloaded from trusted sites. Signed code is better than unsigned code in that it may be easier to determine its author, but it is still potentially harmful, especially when coming from an untrusted zone.'
  tag 'stig', 'V-46573'
  tag severity: 'medium'
  tag checkid: 'C-49739r2_chk'
  tag fixid: 'F-50343r1_fix'
  tag version: 'DTBI112-IE11'
  tag ruleid: 'SV-59437r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Download signed ActiveX controls to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Download signed ActiveX controls must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1001" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46573
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1001') { should eq 3 }
      end

# STOP_DESCRIBE V-46573

end

