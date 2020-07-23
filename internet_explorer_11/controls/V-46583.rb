# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46583 - File downloads must be disallowed (Restricted Sites zone).'
control 'V-46583' do
  impact 0.5
  title 'File downloads must be disallowed (Restricted Sites zone).'
  desc 'Sites located in the Restricted Sites Zone are more likely to contain malicious payloads and therefore downloads from this zone should be blocked. Files should not be able to be downloaded from sites that are considered restricted. This policy setting allows you to manage whether file downloads are permitted from the zone. This option is determined by the zone of the page with the link causing the download, not the zone from which the file is delivered.'
  tag 'stig', 'V-46583'
  tag severity: 'medium'
  tag checkid: 'C-49749r2_chk'
  tag fixid: 'F-50353r1_fix'
  tag version: 'DTBI119-IE11'
  tag ruleid: 'SV-59447r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow file downloads to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow file downloads must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1803" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46583
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1803') { should eq 3 }
      end

# STOP_DESCRIBE V-46583

end

