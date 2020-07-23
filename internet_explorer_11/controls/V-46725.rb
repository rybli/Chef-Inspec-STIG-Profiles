# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46725 - Internet Explorer Processes for MK protocol must be enforced (iexplore).'
control 'V-46725' do
  impact 0.5
  title 'Internet Explorer Processes for MK protocol must be enforced (iexplore).'
  desc 'The MK Protocol Security Restriction policy setting reduces attack surface area by blocking the seldom used MK protocol. Some older web applications use the MK protocol to retrieve information from compressed files. Because the MK protocol is not widely used, it should be blocked wherever it is not needed. Setting this policy to "Enabled"; blocks the MK protocol for Windows Explorer and Internet Explorer, which causes resources that use the MK protocol to fail. Disabling this setting allows applications to use the MK protocol API. This guide recommends you configure this setting to "Enabled" to block the MK protocol unless specifically needed in the environment. Note: Because resources that use the MK protocol will fail when deploying this setting, ensure none of the applications use the MK protocol.'
  tag 'stig', 'V-46725'
  tag severity: 'medium'
  tag checkid: 'C-49867r2_chk'
  tag fixid: 'F-50481r1_fix'
  tag version: 'DTBI605-IE11'
  tag ruleid: 'SV-59589r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> MK Protocol Security Restriction -> Internet Explorer Processes to Enabled. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> MK Protocol Security Restriction -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_MK_PROTOCOL Criteria: If the value "iexplore.exe" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46725
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_MK_PROTOCOL',
      }) do
        its('iexplore.exe') { should eq 1 }
      end

# STOP_DESCRIBE V-46725

end

