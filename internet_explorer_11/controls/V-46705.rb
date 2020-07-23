# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46705 - Automatic prompting for file downloads must be disallowed (Restricted Sites zone).'
control 'V-46705' do
  impact 0.5
  title 'Automatic prompting for file downloads must be disallowed (Restricted Sites zone).'
  desc 'This policy setting determines whether users will be prompted for non user-initiated file downloads. Regardless of this setting, users will receive file download dialogs for user-initiated downloads. Users may accept downloads that they did not request, and those downloaded files may include malicious code. If you enable this setting, users will receive a file download dialog for automatic download attempts. If you disable or do not configure this setting, file downloads that are not user-initiated will be blocked, and users will see the information bar instead of the file download dialog. Users can then click the information bar to allow the file download prompt.'
  tag 'stig', 'V-46705'
  tag severity: 'medium'
  tag checkid: 'C-49849r2_chk'
  tag fixid: 'F-50463r1_fix'
  tag version: 'DTBI580-IE11'
  tag ruleid: 'SV-59569r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Automatic prompting for file downloads to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Automatic prompting for file downloads must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "2200" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46705
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2200') { should eq 3 }
      end

# STOP_DESCRIBE V-46705

end

