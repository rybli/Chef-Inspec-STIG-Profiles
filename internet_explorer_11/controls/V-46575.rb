# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46575 - The Download unsigned ActiveX controls property must be disallowed (Restricted Sites zone).'
control 'V-46575' do
  impact 0.5
  title 'The Download unsigned ActiveX controls property must be disallowed (Restricted Sites zone).'
  desc 'Unsigned code is potentially harmful, especially when coming from an untrusted zone. ActiveX controls can contain potentially malicious code and must only be allowed to be downloaded from trusted sites. They must also be digitally signed.'
  tag 'stig', 'V-46575'
  tag severity: 'medium'
  tag checkid: 'C-49741r2_chk'
  tag fixid: 'F-50345r1_fix'
  tag version: 'DTBI113-IE11'
  tag ruleid: 'SV-59439r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Download unsigned ActiveX controls to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Download unsigned ActiveX controls must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1004" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46575
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1004') { should eq 3 }
      end

# STOP_DESCRIBE V-46575

end

