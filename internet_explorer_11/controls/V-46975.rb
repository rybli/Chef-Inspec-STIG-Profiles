# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46975 - When Enhanced Protected Mode is enabled, ActiveX controls must be disallowed to run in Protected Mode.'
control 'V-46975' do
  impact 0.5
  title 'When Enhanced Protected Mode is enabled, ActiveX controls must be disallowed to run in Protected Mode.'
  desc 'This setting prevents ActiveX controls from running in Protected Mode when Enhanced Protected Mode is enabled. When a user has an ActiveX control installed that is not compatible with Enhanced Protected Mode and a website attempts to load the control, Internet Explorer notifies the user and gives the option to run the website in regular Protected Mode. This policy setting disables this notification and forces all websites to run in Enhanced Protected Mode. Enhanced Protected Mode provides additional protection against malicious websites by using 64-bit processes on 64-bit versions of Windows. For computers running at least Windows 8, Enhanced Protected Mode also limits the locations Internet Explorer can read from in the registry and the file system. If you enable this policy setting, Internet Explorer will not give the user the option to disable Enhanced Protected Mode. All Protected Mode websites will run in Enhanced Protected Mode. If you disable or do not configure this policy setting, Internet Explorer notifies users and provides an option to run websites with incompatible ActiveX controls in regular Protected Mode.'
  tag 'stig', 'V-46975'
  tag severity: 'medium'
  tag checkid: 'C-49971r2_chk'
  tag fixid: 'F-50705r1_fix'
  tag version: 'DTBI985-IE11'
  tag ruleid: 'SV-59841r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel-> Advanced Page Do not allow ActiveX controls to run in Protected Mode when Enhanced Protected Mode is enabled to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer-> Internet Control Panel-> Advanced Page Do not allow ActiveX controls to run in Protected Mode when Enhanced Protected Mode is enabled must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main Criteria: If the value "DisableEPMCompat" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46975
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main',
      }) do
        its('DisableEPMCompat') { should eq 1 }
      end

# STOP_DESCRIBE V-46975

end

