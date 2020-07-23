# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46927 - Scriptlets must be disallowed (Restricted Sites zone).'
control 'V-46927' do
  impact 0.5
  title 'Scriptlets must be disallowed (Restricted Sites zone).'
  desc 'This policy setting allows you to manage whether scriptlets can be allowed. Scriptlets hosted on sites located in this zone are more likely to contain malicious code. If you enable this policy setting, users will be able to run scriptlets. If you disable this policy setting, users will not be able to run scriptlets. If you do not configure this policy setting, a scriptlet can be enabled or disabled by the user.'
  tag 'stig', 'V-46927'
  tag severity: 'medium'
  tag checkid: 'C-49961r2_chk'
  tag fixid: 'F-50661r1_fix'
  tag version: 'DTBI940-IE11'
  tag ruleid: 'SV-59793r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone Allow Scriptlets to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone Allow Scriptlets must be Enabled, and Disable selected from the drop-down box.  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1209" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46927
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1209') { should eq 3 }
      end

# STOP_DESCRIBE V-46927

end

