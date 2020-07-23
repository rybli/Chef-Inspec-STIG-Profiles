# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46591 - The Allow META REFRESH property must be disallowed (Restricted Sites zone).'
control 'V-46591' do
  impact 0.5
  title 'The Allow META REFRESH property must be disallowed (Restricted Sites zone).'
  desc 'It is possible that users will unknowingly be redirected to a site hosting malicious content. Allow META REFRESH must have a level of protection based upon the site being browsed. This policy setting allows you to manage whether a users browser can be redirected to another web page if the author of the web page uses the Meta Refresh setting to redirect browsers to another web page.'
  tag 'stig', 'V-46591'
  tag severity: 'medium'
  tag checkid: 'C-49757r2_chk'
  tag fixid: 'F-50361r1_fix'
  tag version: 'DTBI123-IE11'
  tag ruleid: 'SV-59455r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow META REFRESH to Enabled, and select Disable from the drop-down box.'
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow META REFRESH must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1608" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46591
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1608') { should eq 3 }
      end

# STOP_DESCRIBE V-46591

end

