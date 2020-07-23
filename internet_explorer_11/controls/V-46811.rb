# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46811 - Crash Detection management must be enforced.'
control 'V-46811' do
  impact 0.5
  title 'Crash Detection management must be enforced.'
  desc 'The Turn off Crash Detection policy setting allows you to manage the crash detection 
  feature of add-on management in Internet Explorer. A crash report could contain sensitive 
  information from the computers memory. If you enable this policy setting, a crash in Internet 
  Explorer will be similar to one on a computer running Windows XP Professional Service Pack 1 
  and earlier, where Windows Error Reporting will be invoked. If you disable this policy setting, 
  the crash detection feature in add-on management will be functional.'
  tag 'stig', 'V-46811'
  tag severity: 'medium'
  tag checkid: 'C-49903r2_chk'
  tag fixid: 'F-50561r1_fix'
  tag version: 'DTBI715-IE11'
  tag ruleid: 'SV-59677r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Turn off Crash Detection to Enabled.'
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Turn off Crash Detection must be Enabled. 
  
  Procedure: 
  Use the Windows Registry Editor to navigate to the following key: 
  HKLM\Software\Policies\Microsoft\Internet Explorer\Restrictions 
  
  Criteria: If the value "NoCrashDetection" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46811
    
  describe registry_key('HKLM\Software\Policies\Microsoft\Internet Explorer\Restrictions') do
    its('NoCrashDetection') { should eq 1 }
  end

# STOP_DESCRIBE V-46811

end

