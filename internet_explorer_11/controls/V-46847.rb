# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46847 - InPrivate Browsing must be disallowed.'
control 'V-46847' do
  impact 0.5
  title 'InPrivate Browsing must be disallowed.'
  desc 'InPrivate Browsing lets the user control whether or not Internet Explorer saves the browsing history, cookies, and other data. User control of settings is not the preferred control method. The InPrivate Browsing feature in Internet Explorer makes browser privacy easy by not storing history, cookies, temporary Internet files, or other data. If you enable this policy setting, InPrivate Browsing will be disabled. If you disable this policy setting, InPrivate Browsing will be available for use. If you do not configure this setting, InPrivate Browsing can be turned on or off through the registry.'
  tag 'stig', 'V-46847'
  tag severity: 'medium'
  tag checkid: 'C-49923r2_chk'
  tag fixid: 'F-50583r1_fix'
  tag version: 'DTBI780-IE11'
  tag ruleid: 'SV-59713r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Privacy -> Turn off InPrivate Browsing to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Privacy -> Turn off InPrivate Browsing must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Privacy Criteria: If the value "EnableInPrivateBrowsing" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46847
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Privacy',
      }) do
        its('EnableInPrivateBrowsing') { should eq 0 }
      end

# STOP_DESCRIBE V-46847

end

