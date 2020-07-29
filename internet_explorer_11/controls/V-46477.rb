# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46477 - Check for publishers certificate revocation must be enforced.'
control 'V-46477' do
  impact 0.1
  title 'Check for publishers certificate revocation must be enforced.'
  desc 'Check for publishers certificate revocation options should be enforced to ensure all PKI signed objects are validated.'
  tag 'stig', 'V-46477'
  tag severity: 'low'
  tag checkid: 'C-49687r7_chk'
  tag fixid: 'F-50269r8_fix'
  tag version: 'DTBI018-IE11'
  tag ruleid: 'SV-59341r4_rule'
  tag fixtext: 'If the system is on the SIPRNet, this requirement is NA.

Open Internet Explorer.
From the menu bar, select "Tools".
From the "Tools" drop-down menu, select "Internet Options". From the "Internet Options" window, 
select the "Advanced" tab from the "Advanced" tab window, scroll down to the "Security" category, 
and select the "Check for publishers certificate revocation" box.

Note: Manual entry in the registry key:
HKCU\Software\Microsoft\Windows\Current Version\WinTrust\Trust Providers\Software Publishing 
for the value "State", set to "REG_DWORD = 23C00", may first be required.'
  tag checktext: 'If the system is on the SIPRNet, this requirement is NA.

Open Internet Explorer.
From the menu bar, select "Tools".
From the "Tools" drop-down menu, select "Internet Options". From the "Internet Options" window, 
select the "Advanced" tab, from the "Advanced" tab window, scroll down to the "Security" category, 
and verify the "Check for publishers certificate revocation" box is selected.

Procedure: Use the Windows Registry Editor to navigate to the following key: 
HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing Criteria

If the value "State" is "REG_DWORD = 23C00", this is not a finding.'

# START_DESCRIBE V-46477
# TODO This check is not working for some reason. Tested against correct setting and only sees 'nil'
    describe registry_key('HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing Criteria') do
      its('State') { should eq 146432 } # 23C00 is equal to 146432.
    end

# STOP_DESCRIBE V-46477

end

