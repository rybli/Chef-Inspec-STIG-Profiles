# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46603 - Active scripting must be disallowed (Restricted Sites Zone).'
control 'V-46603' do
  impact 0.5
  title 'Active scripting must be disallowed (Restricted Sites Zone).'
  desc 'Active scripts hosted on sites located in this zone are more likely to contain malicious code. Active scripting must have a level of protection based upon the site being accessed. This policy setting allows you to manage whether script code on pages in the zone are run.'
  tag 'stig', 'V-46603'
  tag severity: 'medium'
  tag checkid: 'C-49769r2_chk'
  tag fixid: 'F-50373r1_fix'
  tag version: 'DTBI133-IE11'
  tag ruleid: 'SV-59467r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow active scripting to Enabled, and select Disable from the drop-down box. '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Restricted Sites Zone -> Allow active scripting must be Enabled, and Disable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4 Criteria: If the value "1400" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46603
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4',
      }) do
        its('1400') { should eq 3 }
      end

# STOP_DESCRIBE V-46603

end

