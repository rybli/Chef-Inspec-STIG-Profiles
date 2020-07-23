# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46701 - Allow binary and script behaviors must be disallowed (Restricted Sites zone).'
control 'V-46701' do
  impact 0.5
  title 'Allow binary and script behaviors must be disallowed (Restricted Sites zone).'
  desc 'This policy setting allows you to manage dynamic binary and script behaviors of components that encapsulate specific functionality for HTML elements, to which they were attached. If you enable this policy setting, binary and script behaviors are available.   If you select "Administrator approved" in the drop-down box, only the behaviors listed in the Admin-approved Behaviors under Binary Behaviors Security Restriction policy are available.    If you disable this policy setting, binary and script behaviors are not available unless applications have implemented a custom security manager. If you do not configure this policy setting, binary and script behaviors are available.'
  tag 'stig', 'V-46701'
  tag severity: 'medium'
  tag checkid: 'C-49847r2_chk'
  tag fixid: 'F-50461r1_fix'
  tag version: 'DTBI575-IE11'
  tag ruleid: 'SV-59565r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow binary and script behaviors to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow binary and script behaviors must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "2000" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46701
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2000') { should eq 3 }
      end

# STOP_DESCRIBE V-46701

end

