# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46685 - Protected Mode must be enforced (Restricted Sites zone).'
control 'V-46685' do
  impact 0.5
  title 'Protected Mode must be enforced (Restricted Sites zone).'
  desc 'Protected Mode protects Internet Explorer from exploited vulnerabilities by reducing the locations Internet Explorer can write to in the registry and the file system. If you enable this policy setting, Protected Mode will be turned on. Users will not be able to turn off Protected Mode. If you disable this policy setting, Protected Mode will be turned off. It will revert to Internet Explorer 6 behavior that allows for Internet Explorer to write to the registry and the file system. Users will not be able to turn on Protected Mode. If you do not configure this policy, users will be able to turn on or off Protected Mode.'
  tag 'stig', 'V-46685'
  tag severity: 'medium'
  tag checkid: 'C-49837r2_chk'
  tag fixid: 'F-50449r1_fix'
  tag version: 'DTBI490-IE11'
  tag ruleid: 'SV-59549r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Turn on Protected Mode to Enabled and select Enable, from the drop-down box.  '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Turn on Protected Mode must be Enabled, and Enable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "2500" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46685
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2500') { should eq 0 }
      end

# STOP_DESCRIBE V-46685

end

