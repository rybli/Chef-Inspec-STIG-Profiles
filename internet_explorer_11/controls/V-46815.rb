# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46815 - Turn on the auto-complete feature for user names and passwords on forms must be disabled.'
control 'V-46815' do
  impact 0.5
  title 'Turn on the auto-complete feature for user names and passwords on forms must be disabled.'
  desc 'This policy setting controls automatic completion of fields in forms on web pages. 
  It is possible that malware could be developed which would be able to extract the cached user 
  names and passwords from the currently logged on user, which an attacker could then use to 
  compromise that users online accounts.  If you enable this setting, the user cannot change 
  the User name and passwords on forms or prompt me to save passwords. The Auto Complete feature 
  for "User names and passwords on forms" will be turned on. If you disable this setting, 
  the user cannot change the User name and passwords on forms or prompt me to save passwords. 
  The Auto Complete feature for "User names and passwords on forms" is turned off. The user 
  also cannot opt to be prompted to save passwords. If you do not configure this setting, 
  the user has the freedom of turning on Auto Complete for "User name and passwords on forms", 
  and the option of prompting to save passwords.'
  tag 'stig', 'V-46815'
  tag severity: 'medium'
  tag checkid: 'C-49905r3_chk'
  tag fixid: 'F-50563r1_fix'
  tag version: 'DTBI725-IE11'
  tag ruleid: 'SV-59681r1_rule'
  tag fixtext: 'Set the policy value for User Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Turn on the auto-complete feature for user names 
  and passwords on forms to Disabled.'
  tag checktext: 'The policy value for User Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Turn on the auto-complete feature for user 
  names and passwords on forms must be Disabled. 

Procedure: 
Use the Windows Registry Editor to navigate to the following key: 
HKCU\Software\Policies\Microsoft\Internet Explorer\Main 

Criteria: If the value "FormSuggest Passwords" is REG_SZ = no, this is not a finding. 

AND 

Procedure: 
Use the Windows Registry Editor to navigate to the following key: 
HKCU\Software\Policies\Microsoft\Internet Explorer\Main 

Criteria: If the value "FormSuggest PW Ask" is REG_SZ = no, this is not a finding.'

# START_DESCRIBE V-46815
  
  describe registry_key('HKCU\Software\Policies\Microsoft\Internet Explorer\Main') do
    its('FormSuggest Passwords') { should eq 'no' }
  end

  describe registry_key('HKCU\Software\Policies\Microsoft\Internet Explorer\Main') do
    its('FormSuggest PW Ask') { should eq 'no' }
  end

# STOP_DESCRIBE V-46815

end

