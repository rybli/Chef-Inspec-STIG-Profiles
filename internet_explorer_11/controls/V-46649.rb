# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46649 - Java permissions must be disallowed (Locked Down Intranet zone).'
control 'V-46649' do
  impact 0.5
  title 'Java permissions must be disallowed (Locked Down Intranet zone).'
  desc 'Java applications could contain malicious code. This policy setting allows you to 
  manage permissions for Java applets. If you enable this policy setting, options can be 
  chosen from the drop-down box. Use of the Custom permission will control permissions 
  settings individually. Use of the Low Safety permission enables applets to perform all 
  operations. Use of the Medium Safety permission enables applets to run in their 
  sandbox (an area in memory outside of which the program cannot make calls), plus 
  adds capabilities like scratch space (a safe and secure storage area on the 
  client computer) and a user-controlled file I/O. Use of the High Safety permission 
  enables applets to run in their sandbox. If you disable this policy setting, Java 
  applets cannot run. If you do not configure this policy setting, the permission is 
  set to High Safety.'
  tag 'stig', 'V-46649'
  tag severity: 'medium'
  tag checkid: 'C-49815r2_chk'
  tag fixid: 'F-50419r1_fix'
  tag version: 'DTBI435-IE11'
  tag ruleid: 'SV-59513r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> 
  Locked-Down Intranet Zone -> Java permissions to Enabled, and select Disable Java from 
  the drop-down box.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> 
  Windows Components -> Internet Explorer -> Internet Control Panel -> Security Page -> 
  Locked-Down Intranet Zone -> Java permissions must be Enabled, and Disable Java selected 
  from the drop-down box. 
  
  Procedure: 
  Use the Windows Registry Editor to navigate to the following keys: 
  HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1 
  
  Criteria: 
  If the value" 1C00" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46649
    describe registry_key('HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1') do
      its('1C00') { should eq 0 }
    end

# STOP_DESCRIBE V-46649

end

