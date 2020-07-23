# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46865 - ActiveX controls without prompt property must be used in approved domains only (Internet zone).'
control 'V-46865' do
  impact 0.5
  title 'ActiveX controls without prompt property must be used in approved domains only (Internet zone).'
  desc 'This policy setting controls whether or not the user is prompted to allow ActiveX controls to run on websites other than the website that installed the ActiveX control. If the user were to disable the setting for the zone, malicious ActiveX controls could be executed without the users knowledge. Disabling this setting would allow the possibility for malicious ActiveX controls to be executed from non-approved domains within this zone without the users knowledge. Enabling this setting enforces the default value and prohibits the user from changing the value. Websites should be moved into another zone if permissions need to be changed.'
  tag 'stig', 'V-46865'
  tag severity: 'medium'
  tag checkid: 'C-49937r2_chk'
  tag fixid: 'F-50603r1_fix'
  tag version: 'DTBI830-IE11'
  tag ruleid: 'SV-59729r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone -> Allow only approved domains to use ActiveX controls without prompt to Enabled, and select Enable from the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> Internet Zone ->  Allow only approved domains to use ActiveX controls without prompt must be Enabled, and Enable selected from the drop-down box. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 Criteria: If the value "120b" is REG_DWORD = 3, this is not a finding.'

# START_DESCRIBE V-46865
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3',
      }) do
        its('120b') { should eq 3 }
      end

# STOP_DESCRIBE V-46865

end

