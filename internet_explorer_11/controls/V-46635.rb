# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46635 - All network paths (UNCs) for Intranet sites must be disallowed.'
control 'V-46635' do
  impact 0.5
  title 'All network paths (UNCs) for Intranet sites must be disallowed.'
  desc 'Some UNC paths could refer to servers not managed by the organization, which means they could host malicious content; and therefore, it is safest to not include all UNC paths in the Intranet Sites zone. This policy setting controls whether URLs representing UNCs are mapped into the local Intranet security zone. If you enable this policy setting, all network paths are mapped into the Intranet Zone. If you disable this policy setting, network paths are not necessarily mapped into the Intranet Zone (other rules might map one there). If you do not configure this policy setting, users choose whether network paths are mapped into the Intranet Zone.'
  tag 'stig', 'V-46635'
  tag severity: 'medium'
  tag checkid: 'C-49801r2_chk'
  tag fixid: 'F-50405r1_fix'
  tag version: 'DTBI375-IE11'
  tag ruleid: 'SV-59499r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Intranet Sites: Include all network paths (UNCs) to Disabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Intranet Sites: Include all network paths (UNCs) must be Disabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap Criteria: If the value "UNCAsIntranet" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46635
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap',
      }) do
        its('UNCAsIntranet') { should eq 0 }
      end

# STOP_DESCRIBE V-46635

end

