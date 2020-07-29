# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-72761 - Use of the Tabular Data Control (TDC) ActiveX control must be disabled for the Internet Zone.'
control 'V-72761' do
  impact 0.5
  title 'Use of the Tabular Data Control (TDC) ActiveX control must be disabled for the Internet Zone.'
  desc 'This policy setting determines whether users can run the Tabular Data Control (TDC) 
  ActiveX control, based on security zone. By default, the TDC ActiveX Control is disabled 
  in the Internet and Restricted Sites security zones. If you enable this policy setting, 
  users will not be able to run the TDC ActiveX control from all sites in the specified zone.'
  tag 'stig', 'V-72761'
  tag severity: 'medium'
  tag checkid: ''
  tag fixid: ''
  tag version: 'DTBI1115-IE11'
  tag ruleid: 'SV-87399r2_rule'
  tag fixtext: 'In the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Internet Control Pane >> Security Page >> 
  Internet Zone, set the "Allow only approved domains to use the TDC ActiveX control" to “Enabled”.'
  tag checktext: 'Note: Only applies to Windows 10 version 1607 and higher and Windows 
  Server 2016 systems. For other Windows versions, this check is Not Applicable. 

In the policy value for Computer Configuration >> Administrative Templates >> 
Windows Components >> Internet Explorer >> Internet Control Panel >> Security Page >> 
Internet Zone, verify "Allow only approved domains to use the TDC ActiveX control" is “Enabled”. 

In the Options window, verify the “Only allow approved domains to use the TDC ActiveX control" 
drop-down box is set to “Enable”. 

Procedure: Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3 

Criteria: 
If the value "120c" is REG_DWORD = “3”, this is not a finding.'

# START_DESCRIBE V-72761
  
    describe registry_key('HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3') do
        its('120c') { should eq 3 }
    end

# STOP_DESCRIBE V-72761

end