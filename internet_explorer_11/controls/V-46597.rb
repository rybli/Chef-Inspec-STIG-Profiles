# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46597 - Launching programs and files in IFRAME must be disallowed (Restricted Sites zone).'
control 'V-46597' do
  impact 0.5
  title 'Launching programs and files in IFRAME must be disallowed (Restricted Sites zone).'
  desc 'This policy setting allows you to manage whether applications may be run and files may be downloaded from an IFRAME reference in the HTML of the pages in this zone. Launching of programs in IFRAME must have a level of protection based upon the site being accessed. If you enable this policy setting, applications can run and files can be downloaded from IFRAMEs on the pages in this zone without user intervention. If you disable this setting, users are prevented from running applications and downloading files from IFRAMEs on the pages in this zone.'
  tag 'stig', 'V-46597'
  tag severity: 'medium'
  tag checkid: 'C-49763r2_chk'
  tag fixid: 'F-50367r1_fix'
  tag version: 'DTBI128-IE11'
  tag ruleid: 'SV-59461r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Launching applications and files in an IFRAME to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Launching applications and files in an IFRAME must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1804" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46597
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1804') { should eq 3 }
      end

# STOP_DESCRIBE V-46597

end

