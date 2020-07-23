# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64713 - Prevent bypassing SmartScreen Filter warnings about files that are not commonly downloaded from the internet must be enabled.'
control 'V-64713' do
  impact 0.5
  title 'Prevent bypassing SmartScreen Filter warnings about files that are not commonly downloaded from the internet must be enabled.'
  desc 'This policy setting determines whether the user can bypass warnings from SmartScreen Filter. 
  SmartScreen Filter warns the user about executable files that Internet Explorer users do 
  not commonly download from the internet. If you enable this policy setting, SmartScreen 
  Filter warnings block the user. If you disable or do not configure this policy setting, 
  the user can bypass SmartScreen Filter warnings.'
  tag 'stig', 'V-64713'
  tag severity: 'medium'
  tag checkid: 'C-65455r3_chk'
  tag fixid: 'F-70643r1_fix'
  tag version: 'DTBI1065-IE11'
  tag ruleid: 'SV-79203r1_rule'
  tag fixtext: 'If the system is on the SIPRNet, this requirement is NA.
  
  Set the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> ”Prevent bypassing SmartScreen Filter warnings 
  about files that are not commonly downloaded from the internet” to ”Enabled”.'
  tag checktext: 'If the system is on the SIPRNet, this requirement is NA.

  The policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> ”Prevent bypassing SmartScreen Filter warnings 
  about files that are not commonly downloaded from the internet” must be ”Enabled”. 

Procedure: Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Policies\Microsoft\Internet Explorer\PhishingFilter.

Criteria: If the value "PreventOverrideAppRepUnknown" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-64713
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\PhishingFilter',
      }) do
        its('PreventOverrideAppRepUnknown') { should eq 1 }
      end

# STOP_DESCRIBE V-64713

end

