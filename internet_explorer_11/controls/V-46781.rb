# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46781 - Internet Explorer Processes for Restrict File Download must be enforced (iexplore).'
control 'V-46781' do
  impact 0.5
  title 'Internet Explorer Processes for Restrict File Download must be enforced (iexplore).'
  desc 'In certain circumstances, websites can initiate file download prompts without interaction from users. This technique can allow websites to put unauthorized files on users hard drives if they click the wrong button and accept the download. If you configure the Restrict File Download\Internet Explorer Processes policy setting to "Enabled", file download prompts that are not user-initiated are blocked for Internet Explorer processes. If you configure this policy setting as "Disabled", prompting will occur for file downloads that are not user-initiated for Internet Explorer processes. Note: This setting is configured as "Enabled" in all environments specified in this guide to help prevent attackers from placing arbitrary code on users computers.'
  tag 'stig', 'V-46781'
  tag severity: 'medium'
  tag checkid: 'C-49879r2_chk'
  tag fixid: 'F-50531r1_fix'
  tag version: 'DTBI640-IE11'
  tag ruleid: 'SV-59647r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Restrict File Download -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Restrict File Download -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_FILEDOWNLOAD Criteria: If the value "iexplore.exe" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46781

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_FILEDOWNLOAD',
      }) do
       its(['iexplore.exe']) { should eq '1' }
      end

# STOP_DESCRIBE V-46781

end
