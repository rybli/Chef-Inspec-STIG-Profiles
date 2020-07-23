# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46617 - Internet Explorer must be configured to disallow users to change policies.'
control 'V-46617' do
  impact 0.5
  title 'Internet Explorer must be configured to disallow users to change policies.'
  desc 'Users who change their Internet Explorer security settings could enable the execution of dangerous types of code from the Internet and websites listed in the Restricted Sites zone in the browser. This setting prevents users from changing the Internet Explorer policies on the machine. Policy changes should be made by administrators only, so this setting should be enabled. If you enable this policy setting, you disable the "Custom level" button and "Security" level for this zone slider on the Security tab in the Internet Options dialog box. If this policy setting is disabled or not configured, users will be able to change the settings for security zones. It prevents users from changing security zone policy settings that are established by the administrator.'
  tag 'stig', 'V-46617'
  tag severity: 'medium'
  tag checkid: 'C-49783r2_chk'
  tag fixid: 'F-50387r1_fix'
  tag version: 'DTBI319-IE11'
  tag ruleid: 'SV-59481r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Do not allow users to change policies to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Do not allow users to change policies must be Enabled.  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings Criteria: If the value "Security_options_edit" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46617
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings',
      }) do
        its('Security_options_edit') { should eq 1 }
      end

# STOP_DESCRIBE V-46617

end

