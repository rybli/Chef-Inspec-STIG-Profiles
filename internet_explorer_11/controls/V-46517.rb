# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46517 - Userdata persistence must be disallowed (Internet zone).'
control 'V-46517' do
  impact 0.5
  title 'Userdata persistence must be disallowed (Internet zone).'
  desc 'Userdata persistence must have a level of protection based upon the site being accessed. It is possible for sites hosting malicious content to exploit this feature as part of an attack against visitors browsing the site. This policy setting allows you to manage the preservation of information in the browsers history, in Favorites, in an XML store, or directly within a web page saved to disk. When a user returns to a persisted page, the state of the page can be restored if this policy setting is not appropriately configured. '
  tag 'stig', 'V-46517'
  tag severity: 'medium'
  tag checkid: 'C-49707r2_chk'
  tag fixid: 'F-50307r1_fix'
  tag version: 'DTBI042-IE11'
  tag ruleid: 'SV-59381r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Userdata persistence to Enabled, and select Disable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Userdata persistence must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "1606" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46517
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('1606') { should eq 3 }
      end

# STOP_DESCRIBE V-46517

end

