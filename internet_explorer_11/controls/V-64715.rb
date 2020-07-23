# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64715 - Prevent per-user installation of ActiveX controls must be enabled.'
control 'V-64715' do
  impact 0.5
  title 'Prevent per-user installation of ActiveX controls must be enabled.'
  desc 'This policy setting allows you to prevent the installation of ActiveX controls on a per-user basis. If you enable this policy setting, ActiveX controls cannot be installed on a per-user basis. If you disable or do not configure this policy setting, ActiveX controls can be installed on a per-user basis.'
  tag 'stig', 'V-64715'
  tag severity: 'medium'
  tag checkid: 'C-65457r2_chk'
  tag fixid: 'F-70645r1_fix'
  tag version: 'DTBI1070-IE11'
  tag ruleid: 'SV-79205r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> ”Prevent per-user installation of ActiveX controls” to ”Enabled”.   '
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Internet Explorer >> ”Prevent per-user installation of ActiveX controls” must be ”Enabled”. 

Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Security\ActiveX. 

Criteria: If the value "BlockNonAdminActiveXInstall" is REG_DWORD = 1, this is not a finding.
'

# START_DESCRIBE V-64715
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Security\ActiveX',
      }) do
        its('BlockNonAdminActiveXInstall') { should eq 1 }
      end

# STOP_DESCRIBE V-64715

end

