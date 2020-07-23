# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46883 - Scripting of Internet Explorer WebBrowser Control must be disallowed (Restricted Sites zone).'
control 'V-46883' do
  impact 0.5
  title 'Scripting of Internet Explorer WebBrowser Control must be disallowed (Restricted Sites zone).'
  desc 'This policy setting controls whether a page may control embedded WebBrowser Control via script. Scripted code hosted on sites located in this zone is more likely to contain malicious code. If you enable this policy setting, script access to the WebBrowser Control is allowed. If you disable this policy setting, script access to the WebBrowser Control is not allowed. If you do not configure this policy setting, script access to the WebBrowser Control can be enabled or disabled by the user. By default, script access to the WebBrowser Control is only allowed in the Local Machine and Intranet Zones.'
  tag 'stig', 'V-46883'
  tag severity: 'medium'
  tag checkid: 'C-49943r2_chk'
  tag fixid: 'F-50621r1_fix'
  tag version: 'DTBI850-IE11'
  tag ruleid: 'SV-59749r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow scripting of Internet Explorer WebBrowser controls to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow scripting of Internet Explorer WebBrowser controls must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1206" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46883
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1206') { should eq 3 }
      end

# STOP_DESCRIBE V-46883

end

