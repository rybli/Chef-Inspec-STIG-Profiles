# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64711 - Prevent bypassing SmartScreen Filter warnings must be enabled.'
control 'V-64711' do
  impact 0.5
  title 'Prevent bypassing SmartScreen Filter warnings must be enabled.'
  desc 'This policy setting determines whether the user can bypass warnings from SmartScreen Filter. 
  SmartScreen Filter prevents the user from browsing to or downloading from sites that are 
  known to host malicious content. SmartScreen Filter also prevents the execution of files 
  that are known to be malicious. If you enable this policy setting, SmartScreen Filter warnings 
  block the user. If you disable or do not configure this policy setting, the user can bypass 
  SmartScreen Filter warnings.'
  tag 'stig', 'V-64711'
  tag severity: 'medium'
  tag checkid: 'C-65453r2_chk'
  tag fixid: 'F-70641r1_fix'
  tag version: 'DTBI1060-IE11'
  tag ruleid: 'SV-79201r1_rule'
  tag fixtext: 'If the system is on the SIPRNet, this requirement is NA.
  
  Set the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> ”Prevent bypassing SmartScreen Filter warnings” 
  to ”Enabled”.'
  tag checktext: 'If the system is on the SIPRNet, this requirement is NA.

  The policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> ”Prevent bypassing SmartScreen Filter warnings” 
  must be ”Enabled”. 

Procedure: Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Policies\Microsoft\Internet Explorer\PhishingFilter. 

Criteria: If the value "PreventOverride" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-64711
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\PhishingFilter',
      }) do
        its('PreventOverride') { should eq 1 }
      end

# STOP_DESCRIBE V-64711

end

