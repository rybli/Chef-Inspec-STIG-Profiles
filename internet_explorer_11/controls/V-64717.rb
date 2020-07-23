# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64717 - Prevent ignoring certificate errors option must be enabled.'
control 'V-64717' do
  impact 0.5
  title 'Prevent ignoring certificate errors option must be enabled.'
  desc 'This policy setting prevents the user from ignoring Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate errors that interrupt browsing (such as “expired”, “revoked”, or “name mismatch” errors) in Internet Explorer. If you enable this policy setting, the user cannot continue browsing. If you disable or do not configure this policy setting, the user can choose to ignore certificate errors and continue browsing.'
  tag 'stig', 'V-64717'
  tag severity: 'medium'
  tag checkid: 'C-65459r2_chk'
  tag fixid: 'F-70647r1_fix'
  tag version: 'DTBI1075-IE11'
  tag ruleid: 'SV-79207r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> ”Prevent ignoring certificate errors” to ”Enabled”.   '
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> Internet Control Panel >> ”Prevent ignoring certificate errors” must be ”Enabled”. 

Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings. 

Criteria: If the value "PreventIgnoreCertErrors" is REG_DWORD = 1, this is not a finding.
'

# START_DESCRIBE V-64717
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings',
      }) do
        its('PreventIgnoreCertErrors') { should eq 1 }
      end

# STOP_DESCRIBE V-64717

end

