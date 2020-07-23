# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46799 - .NET Framework-reliant components signed with Authenticode must be disallowed to run (Restricted Sites Zone).'
control 'V-46799' do
  impact 0.5
  title '.NET Framework-reliant components signed with Authenticode must be disallowed to run (Restricted Sites Zone).'
  desc 'This policy setting allows you to manage whether .NET Framework-reliant components that are signed with Authenticode can be executed from Internet Explorer. It may be possible for malicious content hosted on a website to take advantage of these components. These components include managed controls referenced from an object tag and managed executables referenced from a link. If you enable this policy setting, Internet Explorer will execute signed managed components. If you select "Prompt" in the drop-down box, Internet Explorer will prompt the user to determine whether to execute signed managed components. If you disable this policy setting, Internet Explorer will not execute signed managed components. If you do not configure this policy setting, Internet Explorer will execute signed managed components.'
  tag 'stig', 'V-46799'
  tag severity: 'medium'
  tag checkid: 'C-49891r2_chk'
  tag fixid: 'F-50549r1_fix'
  tag version: 'DTBI655-IE11'
  tag ruleid: 'SV-59665r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Run .NET Framework-reliant components signed with Authenticode to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Run .NET Framework-reliant components signed with Authenticode must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "2001" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46799
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('2001') { should eq 3 }
      end

# STOP_DESCRIBE V-46799

end

