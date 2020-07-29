# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-97527 - Internet Explorer Development Tools Must Be Disabled.'
control 'V-97527' do
  impact 0.5
  title 'Internet Explorer Development Tools Must Be Disabled.'
  desc 'Information needed by an attacker to begin looking for possible vulnerabilities in 
  a web browser includes any information about the web browser and plug-ins or modules 
  being used. When debugging or trace information is enabled in a production web browser, 
  information about the web browser, such as web browser type, version, patches installed, 
  plug-ins and modules installed, type of code being used by the hosted application, and 
  any back-ends being used for data storage may be displayed. Since this information may 
  be placed in logs and general messages during normal operation of the web browser, 
  an attacker does not need to cause an error condition to gain this information.'
  tag 'stig', 'V-97527'
  tag severity: 'medium'
  tag checkid: ''
  tag fixid: ''
  tag version: 'DTBI1135-IE11'
  tag ruleid: 'SV-106631r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Toolbars >> “Turn off Developer Tools” to “Enabled”.'
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Toolbars >> “Turn off Developer Tools” must be “Enabled”. 

Procedure: 
Use the Windows Registry Editor to navigate to the following key: 
HKEY_LOCAL_Machine\SOFTWARE\Policies\Microsoft\Internet Explorer\IEDevTools

Criteria: 
If the value "Disabled" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-97527
  
    describe registry_key('HKEY_LOCAL_Machine\SOFTWARE\Policies\Microsoft\Internet Explorer\IEDevTools') do
        its('Disabled') { should eq 1 }
    end

# STOP_DESCRIBE V-97527

end

