# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46619 - Internet Explorer must be configured to use machine settings.'
control 'V-46619' do
  impact 0.5
  title 'Internet Explorer must be configured to use machine settings.'
  desc 'Users who change their Internet Explorer security settings could enable the execution of dangerous types of code from the Internet and websites listed in the Restricted Sites zone in the browser. This setting enforces consistent security zone settings to all users of the computer. Security zones control browser behavior at various websites and it is desirable to maintain a consistent policy for all users of a machine. This policy setting affects how security zone changes apply to different users. If you enable this policy setting, changes that one user makes to a security zone will apply to all users of that computer. If this policy setting is disabled or not configured, users of the same computer are allowed to establish their own security zone settings.'
  tag 'stig', 'V-46619'
  tag severity: 'medium'
  tag checkid: 'C-49785r2_chk'
  tag fixid: 'F-50389r1_fix'
  tag version: 'DTBI320-IE11'
  tag ruleid: 'SV-59483r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Use only machine settings to Enabled. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Use only machine settings must be Enabled.  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings Criteria: If the value "Security_HKLM_only" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46619
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings',
      }) do
        its('Security_HKLM_only') { should eq 1 }
      end

# STOP_DESCRIBE V-46619

end

