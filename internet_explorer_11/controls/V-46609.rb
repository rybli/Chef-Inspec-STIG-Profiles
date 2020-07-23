# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46609 - Configuring History setting must be set to 40 days.'
control 'V-46609' do
  impact 0.5
  title 'Configuring History setting must be set to 40 days.'
  desc 'This setting specifies the number of days that Internet Explorer keeps track of the pages viewed in the History List. The delete Browsing History option can be accessed using Tools, Internet Options, "General" tab, and then click Settings under Browsing History. If you enable this policy setting, a user cannot set the number of days that Internet Explorer keeps track of the pages viewed in the History List. The number of days that Internet Explorer keeps track of the pages viewed in the History List must be specified. Users will not be able to delete browsing history. If you disable or do not configure this policy setting, a user can set the number of days that Internet Explorer tracks views of pages in the History List. Users can delete browsing history.'
  tag 'stig', 'V-46609'
  tag severity: 'medium'
  tag checkid: 'C-49775r2_chk'
  tag fixid: 'F-50379r1_fix'
  tag version: 'DTBI300-IE11'
  tag ruleid: 'SV-59473r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Disable Configuring History to Enabled, and enter 40 in Days to keep pages in History.'
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Disable Configuring History must be Enabled, and 40 entered in Days to keep pages in History. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel Criteria: If the value "History" is REG_DWORD = 1, this is not a finding. AND  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Url History Criteria: If the value "DaysToKeep" is REG_DWORD = 40 (decimal), this is not a finding.'

# START_DESCRIBE V-46609

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Control Panel',
      }) do
        it ('History') { should eq 1 }
      end

      describe registry_key({
        hive: 'HKLM',
        key: 'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Url History',
      }) do
        its('DaysToKeep') { should eq 40 }
      end

# STOP_DESCRIBE V-46609

end
