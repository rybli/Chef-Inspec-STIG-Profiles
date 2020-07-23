# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46605 - Clipboard operations via script must be disallowed (Restricted Sites zone).'
control 'V-46605' do
  impact 0.5
  title 'Clipboard operations via script must be disallowed (Restricted Sites zone).'
  desc 'A malicious script could use the clipboard in an undesirable manner, for example, if the user had recently copied confidential information to the clipboard while editing a document, a malicious script could harvest that information. It might be possible to exploit other vulnerabilities in order to send the harvested data to the attacker. Allow paste operations via script must have a level of protection based upon the site being accessed.'
  tag 'stig', 'V-46605'
  tag severity: 'medium'
  tag checkid: 'C-49771r2_chk'
  tag fixid: 'F-50375r1_fix'
  tag version: 'DTBI134-IE11'
  tag ruleid: 'SV-59469r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow cut, copy or paste operations from the clipboard via script to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow cut, copy or paste operations from the clipboard via script must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1407" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46605
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1407') { should eq 3 }
      end

# STOP_DESCRIBE V-46605

end

