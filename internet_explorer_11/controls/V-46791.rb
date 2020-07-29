# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46791 - Internet Explorer Processes for restricting pop-up windows must be enforced (iexplore).'
control 'V-46791' do
  impact 0.5
  title 'Internet Explorer Processes for restricting pop-up windows must be enforced (iexplore).'
  desc 'Internet Explorer allows scripts to programmatically open, resize, and reposition various types of windows. Often, disreputable websites will resize windows to either hide other windows or force a user to interact with a window that contains malicious code. The Scripted Window Security Restrictions security feature restricts pop-up windows and prohibits scripts from displaying windows in which the title and status bars are not visible to the user, or which hide other windows title and status bars. If you enable the Scripted Window Security Restrictions\Internet Explorer Processes policy setting, pop-up windows and other restrictions apply for Windows Explorer and Internet Explorer processes. If you disable or do not configure this policy setting, scripts can continue to create pop-up windows and create windows that hide other windows. This guide recommends configuring this setting to "Enabled" to help prevent malicious websites from controlling the Internet Explorer windows or fooling users into clicking on the wrong window.'
  tag 'stig', 'V-46791'
  tag severity: 'medium'
  tag checkid: 'C-49887r2_chk'
  tag fixid: 'F-50541r1_fix'
  tag version: 'DTBI649-IE11'
  tag ruleid: 'SV-59657r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Scripted Window Security Restrictions -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Scripted Window Security Restrictions -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_WINDOW_RESTRICTIONS Criteria: If the value "iexplore.exe" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46791

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_WINDOW_RESTRICTIONS',
      }) do
       its(['iexplore.exe']) { should eq '1' }
      end

# STOP_DESCRIBE V-46791

end
