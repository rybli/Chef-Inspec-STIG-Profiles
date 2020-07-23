# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46879 - Cross-Site Scripting Filter must be enforced (Internet zone).'
control 'V-46879' do
  impact 0.5
  title 'Cross-Site Scripting Filter must be enforced (Internet zone).'
  desc 'The Cross-Site Scripting Filter is designed to prevent users from becoming victims of unintentional information disclosure. This setting controls if the Cross-Site Scripting (XSS) Filter detects and prevents cross-site script injection into websites in this zone. If you enable this policy setting, the XSS Filter will be enabled for sites in this zone, and the XSS Filter will attempt to block cross-site script injections. If you disable this policy setting, the XSS Filter will be disabled for sites in this zone, and Internet Explorer will permit cross-site script injections.'
  tag 'stig', 'V-46879'
  tag severity: 'medium'
  tag checkid: 'C-49941r2_chk'
  tag fixid: 'F-50615r1_fix'
  tag version: 'DTBI840-IE11'
  tag ruleid: 'SV-59745r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Turn on Cross-Site Scripting Filter to Enabled, and select Enable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Turn on Cross-Site Scripting Filter must be Enabled, and Enable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "1409" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46879
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1409') { should eq 0 }
      end

# STOP_DESCRIBE V-46879

end

