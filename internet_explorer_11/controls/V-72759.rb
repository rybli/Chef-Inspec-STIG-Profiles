# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-72759 - Enabling outdated ActiveX controls for Internet Explorer must be blocked.'
control 'V-72759' do
  impact 0.5
  title 'Enabling outdated ActiveX controls for Internet Explorer must be blocked.'
  desc 'This feature keeps ActiveX controls up to date and helps make them safer to use 
  in Internet Explorer. Many ActiveX controls are not automatically updated as new 
  versions are released. It is very important to keep ActiveX controls up to date because 
  malicious or compromised webpages can target security flaws in out-of-date ActiveX controls.'
  tag 'stig', 'V-72759'
  tag severity: 'medium'
  tag checkid: ''
  tag fixid: ''
  tag version: 'DTBI1110-IE11'
  tag ruleid: 'SV-87397r2_rule'
  tag fixtext: 'In the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Security Features >> Add-on Management, 
  set "Turn off blocking of outdated ActiveX controls for Internet Explorer" to "Disabled".'
  tag checktext: 'In the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Security Features >> Add-on Management, 
  verify "Turn off blocking of outdated ActiveX controls for Internet Explorer" is set to “Disabled”. 

Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext 

If the value "VersionCheckEnabled" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-72759
  
    describe registry_key('HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext') do
        its('VersionCheckEnabled') { should cmp 1 }
    end

# STOP_DESCRIBE V-72759

end