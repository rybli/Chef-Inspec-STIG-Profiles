# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-64729 - Allow Fallback to SSL 3.0 (Internet Explorer) must be disabled.'
control 'V-64729' do
  impact 0.5
  title 'Allow Fallback to SSL 3.0 (Internet Explorer) must be disabled.'
  desc 'This parameter ensures only DoD-approved ciphers and algorithms are enabled for use by 
  the web browser by blocking an insecure fallback to SSL when TLS 1.0 or greater fails.'
  tag 'stig', 'V-64729'
  tag severity: 'medium'
  tag checkid: 'C-65471r3_chk'
  tag fixid: 'F-70659r3_fix'
  tag version: 'DTBI1100-IE11'
  tag ruleid: 'SV-79219r2_rule'
  tag fixtext: 'Open Internet Explorer. From the menu bar, select "Tools". From the "Tools" 
  drop-down menu, select "Internet Options". From the "Internet Options" window, select the 
  "Advanced" tab, from the "Advanced" tab window scroll down to the "Security" category. 
  Uncheck "Use SSL 2.0" and "Use SSL 3.0" options.

Set the policy value for Computer Configuration >> Administrative Templates >> Internet Explorer >> 
Security Features >> "Allow fallback to SSL 3.0 (Internet Explorer)" to "Enabled", and 
select "No Sites" from the drop-down box. 

Set the registry value for 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings?\SecureProtocols must to "2688".'
  tag checktext: 'Open Internet Explorer. From the menu bar, select "Tools". From the "Tools" 
  drop-down menu, select "Internet Options". From the "Internet Options" window, select the 
  "Advanced" tab, from the "Advanced" tab window scroll down to the "Security" category. 
  Verify there is not a check placed in the check box for "Use SSL 2.0" or "Use SSL 3.0". 
  If "Use SSL 2.0" or "Use SSL 3.0" is checked, this is a finding. 

The policy value for Computer Configuration >> Administrative Templates >> Windows Components >> 
Internet Explorer >> Security Features >> "Allow fallback to SSL 3.0 (Internet Explorer)" 
must be "Enabled", and "No Sites" selected from the drop-down box. 
If "Allow fallback to SSL 3.0 (Internet Explorer)" is not "Enabled" or any other drop-down 
option is selected, this is a finding.

The registry value for 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings?\SecureProtocols 
must be "2688".  If the "SecureProtocols" DWORD value is not "2688", this is a finding.'

# START_DESCRIBE V-64729
  
  describe registry_key('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings') do
    its('SecureProtocols') { should eq 2688 }
  end

# STOP_DESCRIBE V-64729

end

