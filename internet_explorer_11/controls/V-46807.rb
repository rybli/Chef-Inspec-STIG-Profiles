# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46807 - AutoComplete feature for forms must be disallowed.'
control 'V-46807' do
  impact 0.5
  title 'AutoComplete feature for forms must be disallowed.'
  desc 'This AutoComplete feature suggests possible matches when users are filling in forms. 
  It is possible that this feature will cache sensitive data and store it in the users profile, 
  where it might not be protected as rigorously as required by organizational policy. 
  If you enable this setting, the user is not presented with suggested matches when filling in forms. 
  If you disable this setting, the user is presented with suggested possible matches when filling forms. 
  If you do not configure this setting, the user has the freedom to turn on the auto-complete 
  feature for forms. To display this option, the user opens the Internet Options dialog box, 
  clicks the "Contents" tab, and clicks the "Settings" button.'
  tag 'stig', 'V-46807'
  tag severity: 'medium'
  tag checkid: 'C-49899r2_chk'
  tag fixid: 'F-50557r1_fix'
  tag version: 'DTBI690-IE11'
  tag ruleid: 'SV-59673r1_rule'
  tag fixtext: 'Set the policy value for User Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Disable AutoComplete for forms to Enabled.'
  tag checktext: 'The policy value for User Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Disable AutoComplete for forms must be Enabled. 
  
  Procedure: 
  Use the Windows Registry Editor to navigate to the following key: 
  HKCU\Software\Policies\Microsoft\Internet Explorer\Main 
  
  Criteria: If the value "Use FormSuggest" is REG_SZ = no, this is not a finding.'

# START_DESCRIBE V-46807
  describe registry_key('HKCU\Software\Policies\Microsoft\Internet Explorer\Main') do
    its('Use FormSuggest') { should eq 'no' }
  end

# STOP_DESCRIBE V-46807

end

