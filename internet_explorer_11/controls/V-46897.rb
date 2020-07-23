# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46897 - Internet Explorer Processes Restrict ActiveX Install must be enforced (Reserved).'
control 'V-46897' do
  impact 0.5
  title 'Internet Explorer Processes Restrict ActiveX Install must be enforced (Reserved).'
  desc 'Users often choose to install software such as ActiveX controls that are not permitted by their organizations security policy. Such software can pose significant security and privacy risks to networks. This policy setting enables blocking of ActiveX control installation prompts for Internet Explorer processes. If you enable this policy setting, prompts for ActiveX control installations will be blocked for Internet Explorer processes. If you disable this policy setting, prompts for ActiveX control installations will not be blocked and these prompts will be displayed to users. If you do not configure this policy setting, the users preference will be used to determine whether to block ActiveX control installations for Internet Explorer processes.'
  tag 'stig', 'V-46897'
  tag severity: 'medium'
  tag checkid: 'C-49953r3_chk'
  tag fixid: 'F-50635r1_fix'
  tag version: 'DTBI900-IE11'
  tag ruleid: 'SV-59763r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Restrict ActiveX Install -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Restrict ActiveX Install -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_ACTIVEXINSTALL   Criteria: If the value "(Reserved)" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46897

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_ACTIVEXINSTALL',
      }) do
        its('(Reserved)') { should eq '1' }
      end

# STOP_DESCRIBE V-46897

end
