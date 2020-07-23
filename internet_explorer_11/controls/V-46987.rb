# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46987 - Enhanced Protected Mode functionality must be enforced.'
control 'V-46987' do
  impact 0.5
  title 'Enhanced Protected Mode functionality must be enforced.'
  desc 'Enhanced Protected Mode provides additional protection against malicious websites by using 64-bit processes on 64-bit versions of Windows. For computers running at least Windows 8, Enhanced Protected Mode also limits the locations Internet Explorer can read from in the registry and the file system. If you enable this policy setting, Enhanced Protected Mode will be turned on. Any zone that has Protected Mode enabled will use Enhanced Protected Mode. Users will not be able to disable Enhanced Protected Mode. If you disable this policy setting, Enhanced Protected Mode will be turned off. Any zone that has Protected Mode enabled will use the version of Protected Mode introduced in Internet Explorer 7 for Windows Vista. If you do not configure this policy, users will be able to turn on or turn off Enhanced Protected Mode on the "Advanced" tab of the Internet Options dialog box.'
  tag 'stig', 'V-46987'
  tag severity: 'medium'
  tag checkid: 'C-49975r3_chk'
  tag fixid: 'F-50711r2_fix'
  tag version: 'DTBI995-IE11'
  tag ruleid: 'SV-59853r2_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel-> Advanced Page Turn on Enhanced Protected Mode to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel-> Advanced Page Turn on Enhanced Protected Mode must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main Criteria: If the value "Isolation" is REG_SZ = PMEM, this is not a finding.'

# START_DESCRIBE V-46987
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main',
      }) do
        its('Isolation') { should eq 'PMEM' }
      end

# STOP_DESCRIBE V-46987

end

