# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46689 - Pop-up Blocker must be enforced (Internet zone).'
control 'V-46689' do
  impact 0.5
  title 'Pop-up Blocker must be enforced (Internet zone).'
  desc 'This policy setting allows you to manage whether unwanted pop-up windows appear. Pop-up windows that are opened when the end user clicks a link are not blocked. If you enable this policy setting, most unwanted pop-up windows are prevented from appearing. If you disable this policy setting, pop-up windows are not prevented from appearing. If you do not configure this policy setting, most unwanted pop-up windows are prevented from appearing.'
  tag 'stig', 'V-46689'
  tag severity: 'medium'
  tag checkid: 'C-49839r2_chk'
  tag fixid: 'F-50451r1_fix'
  tag version: 'DTBI495-IE11'
  tag ruleid: 'SV-59553r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Use Pop-up Blocker to Enabled, and select Enable from the drop-down box.  '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Use Pop-up Blocker must be Enabled, and Enable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "1809" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46689
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1809') { should eq 0 }
      end

# STOP_DESCRIBE V-46689

end

