# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46615 - Internet Explorer must be set to disallow users to add/delete sites.'
control 'V-46615' do
  impact 0.5
  title 'Internet Explorer must be set to disallow users to add/delete sites.'
  desc 'This setting prevents users from adding sites to various security zones. Users should not be able to add sites to different zones, as this could allow them to bypass security controls of the system. If you do not configure this policy setting, users will be able to add or remove sites from the Trusted Sites and Restricted Sites zones at will and change settings in the Local Intranet zone. This configuration could allow sites that host malicious mobile code to be added to these zones, and users could execute the code.'
  tag 'stig', 'V-46615'
  tag severity: 'medium'
  tag checkid: 'C-49781r2_chk'
  tag fixid: 'F-50385r1_fix'
  tag version: 'DTBI318-IE11'
  tag ruleid: 'SV-59479r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Do not allow users to add/delete sites to Enabled.'
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer Security Zones: Do not allow users to add/delete sites must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings Criteria: If the value "Security_zones_map_edit" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46615
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings',
      }) do
        its('Security_zones_map_edit') { should eq 1 }
      end

# STOP_DESCRIBE V-46615

end

