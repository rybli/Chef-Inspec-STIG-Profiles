# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46473 - Turn off Encryption Support must be enabled.'
control 'V-46473' do
  impact 0.5
  title 'Turn off Encryption Support must be enabled.'
  desc 'This parameter ensures only DoD-approved ciphers and algorithms are enabled for 
  use by the web browser by allowing you to turn on/off support for TLS and SSL. TLS is a 
  protocol for protecting communications between the browser and the target server. When the 
  browser attempts to set up a protected communication with the target server, the browser 
  and server negotiate which protocol and version to use. The browser and server attempt to 
  match each others list of supported protocols and versions and pick the most preferred match.'
  tag 'stig', 'V-46473'
  tag severity: 'medium'
  tag checkid: 'C-49683r15_chk'
  tag fixid: 'F-50263r14_fix'
  tag version: 'DTBI014-IE11'
  tag ruleid: 'SV-59337r5_rule'
  tag fixtext: 'Set the policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Internet Control Panel >> Advanced Page >> 
  "Turn off Encryption Support" to "Enabled".

Select only "Use TLS 1.1" and "Use TLS 1.2" from the drop-down box.'
  tag checktext: 'The policy value for Computer Configuration >> Administrative Templates >> 
  Windows Components >> Internet Explorer >> Internet Control Panel >> Advanced Page >> 
  "Turn off Encryption Support" must be "Enabled".

Verify the only options selected are "Use TLS 1.1" and "Use TLS 1.2" from the drop-down box.

Procedure: Use the Windows Registry Editor to navigate to the following key: 
HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\SecureProtocols.

Criteria: If the value for "SecureProtocols" is not REG_DWORD = "2560", this is a finding.'

# START_DESCRIBE V-46473
  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings') do
    its('SecureProtocols') { should eq 2560 }
  end

# STOP_DESCRIBE V-46473

end

