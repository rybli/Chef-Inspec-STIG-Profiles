# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46633 - Checking for signatures on downloaded programs must be enforced.'
control 'V-46633' do
  impact 0.5
  title 'Checking for signatures on downloaded programs must be enforced.'
  desc 'This policy setting allows you to manage whether Internet Explorer checks for digital signatures (which identifies the publisher of signed software and verifies it has not been modified or tampered with) on user computers before downloading executable programs. If you enable this policy setting, Internet Explorer will check the digital signatures of executable programs and display their identities before downloading them to the user computers. If you disable this policy setting, Internet Explorer will not check the digital signatures of executable programs or display their identities before downloading them to the user computers. If you do not configure this policy, Internet Explorer will not check the digital signatures of executable programs or display their identities before downloading them to the user computers.'
  tag 'stig', 'V-46633'
  tag severity: 'medium'
  tag checkid: 'C-49799r2_chk'
  tag fixid: 'F-50403r1_fix'
  tag version: 'DTBI370-IE11'
  tag ruleid: 'SV-59497r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Check for signatures on downloaded programs to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Check for signatures on downloaded programs must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Download Criteria: If the value "CheckExeSignatures" is REG_SZ = yes, this is not a finding.'

# START_DESCRIBE V-46633

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Download',
      }) do
        its('CheckExeSignatures') { should eq 'yes' }
      end

# STOP_DESCRIBE V-46633

end
