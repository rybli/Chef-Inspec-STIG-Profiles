# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46621 - Security checking features must be enforced.'
control 'V-46621' do
  impact 0.5
  title 'Security checking features must be enforced.'
  desc 'This policy setting turns off the Security Settings Check feature, which checks Internet Explorer security settings to determine when the settings put Internet Explorer at risk. If you enable this policy setting, the security settings check will not be performed. If you disable or do not configure this policy setting, the security settings check will be performed.'
  tag 'stig', 'V-46621'
  tag severity: 'medium'
  tag checkid: 'C-49787r2_chk'
  tag fixid: 'F-50391r1_fix'
  tag version: 'DTBI325-IE11'
  tag ruleid: 'SV-59485r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Turn off the Security Settings Check feature to Disabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Turn off the Security Settings Check feature must be Disabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Security Criteria: If the value "DisableSecuritySettingsCheck" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46621
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Security',
      }) do
        its('DisableSecuritySettingsCheck') { should eq 0 }
      end

# STOP_DESCRIBE V-46621

end

