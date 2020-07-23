# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46995 - The 64-bit tab processes, when running in Enhanced Protected Mode on 64-bit versions of Windows, must be turned on.'
control 'V-46995' do
  impact 0.5
  title 'The 64-bit tab processes, when running in Enhanced Protected Mode on 64-bit versions of Windows, must be turned on.'
  desc 'This policy setting determines whether Internet Explorer 11 uses 64-bit processes (for greater security) or 32-bit processes (for greater compatibility) when running in Enhanced Protected Mode on 64-bit versions of Windows.Important: Some ActiveX controls and toolbars may not be available when 64-bit processes are used. If you enable this policy setting, Internet Explorer 11 will use 64-bit tab processes when running in Enhanced Protected Mode on 64-bit versions of Windows. If you disable this policy setting, Internet Explorer 11 will use 32-bit tab processes when running in Enhanced Protected Mode on 64-bit versions of Windows. If you dont configure this policy setting, users can turn this feature on or off using Internet Explorer settings. This feature is turned off by default.'
  tag 'stig', 'V-46995'
  tag severity: 'medium'
  tag checkid: 'C-49979r2_chk'
  tag fixid: 'F-50715r1_fix'
  tag version: 'DTBI356-IE11'
  tag ruleid: 'SV-59861r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel -> Advanced Page Turn on 64-bit tab processes when running in Enhanced Protected Mode on 64-bit versions of Windows to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel -> Advanced Page Turn on 64-bit tab processes when running in Enhanced Protected Mode on 64-bit versions of Windows must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main  Criteria: If the value  "Isolation64Bit" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46995
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main',
      }) do
        its('Isolation64Bit') { should eq 1 }
      end

# STOP_DESCRIBE V-46995

end

