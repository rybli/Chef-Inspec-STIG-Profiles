# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46857 - Internet Explorer Processes for Notification Bars must be enforced (Reserved).'
control 'V-46857' do
  impact 0.5
  title 'Internet Explorer Processes for Notification Bars must be enforced (Reserved).'
  desc 'This policy setting allows you to manage whether the Notification Bar is displayed for Internet Explorer processes when file or code installs are restricted. By default, the Notification Bar is displayed for Internet Explorer processes. If you enable this policy setting, the Notification Bar will be displayed for Internet Explorer processes. If you disable this policy setting, the Notification Bar will not be displayed for Internet Explorer processes. If you do not configure this policy setting, the Notification Bar will be displayed for Internet Explorer processes.'
  tag 'stig', 'V-46857'
  tag severity: 'medium'
  tag checkid: 'C-49931r2_chk'
  tag fixid: 'F-50591r1_fix'
  tag version: 'DTBI815-IE11'
  tag ruleid: 'SV-59723r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features-> Notification Bar-> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features-> Notification Bar-> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_SECURITYBAND Criteria: If the value "(Reserved)" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46857

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_SECURITYBAND',
      }) do
        its('(Reserved)') { should eq '1' }
      end

# STOP_DESCRIBE V-46857

end
