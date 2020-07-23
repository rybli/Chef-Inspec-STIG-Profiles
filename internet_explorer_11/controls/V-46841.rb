# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46841 - Deleting websites that the user has visited must be disallowed.'
control 'V-46841' do
  impact 0.5
  title 'Deleting websites that the user has visited must be disallowed.'
  desc 'This policy prevents users from deleting the history of websites the user has visited. If you enable this policy setting, websites the user has visited will be preserved when the user clicks "Delete". If you disable this policy setting, websites that the user has visited will be deleted when the user clicks "Delete". If you do not configure this policy setting, the user will be able to select whether to delete or preserve websites the user visited when the user clicks "Delete".'
  tag 'stig', 'V-46841'
  tag severity: 'medium'
  tag checkid: 'C-49919r2_chk'
  tag fixid: 'F-50579r1_fix'
  tag version: 'DTBI770-IE11'
  tag ruleid: 'SV-59707r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Prevent Deleting Web sites that the User has Visited to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Prevent Deleting Web sites that the User has Visited must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Privacy Criteria: If the value "CleanHistory" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46841
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Privacy',
      }) do
        its('CleanHistory') { should eq 0 }
      end

# STOP_DESCRIBE V-46841

end

