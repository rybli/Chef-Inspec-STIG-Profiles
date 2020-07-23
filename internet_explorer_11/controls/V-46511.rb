# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46511 - Functionality to drag and drop or copy and paste files must be disallowed (Internet zone).'
control 'V-46511' do
  impact 0.5
  title 'Functionality to drag and drop or copy and paste files must be disallowed (Internet zone).'
  desc 'Content hosted on sites located in the Internet zone are likely to contain malicious payloads and therefore this feature should be blocked for this zone. Drag and drop or copy and paste files must have a level of protection based upon the site being accessed.'
  tag 'stig', 'V-46511'
  tag severity: 'medium'
  tag checkid: 'C-49701r2_chk'
  tag fixid: 'F-50301r1_fix'
  tag version: 'DTBI036-IE11'
  tag ruleid: 'SV-59375r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Allow drag and drop or copy and paste files to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Allow drag and drop or copy and paste files must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value for "1802" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46511
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1802') { should eq 3 }
      end

# STOP_DESCRIBE V-46511

end

