# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46625 - Software must be disallowed to run or install with invalid signatures.'
control 'V-46625' do
  impact 0.5
  title 'Software must be disallowed to run or install with invalid signatures.'
  desc 'Microsoft ActiveX controls and file downloads often have digital signatures attached that certify the files integrity and the identity of the signer (creator) of the software. Such signatures help ensure unmodified software is downloaded and the user can positively identify the signer to determine whether you trust them enough to run their software.'
  tag 'stig', 'V-46625'
  tag severity: 'medium'
  tag checkid: 'C-49791r3_chk'
  tag fixid: 'F-50395r1_fix'
  tag version: 'DTBI350-IE11'
  tag ruleid: 'SV-59489r2_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Allow software to run or install even if the signature is invalid to Disabled. '
  tag checktext: 'Note: Some legitimate software and controls may have an invalid signature. You should carefully test such software in isolation before it is allowed to be used on an organizations network.

The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Allow software to run or install even if the signature is invalid must be Disabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Download Criteria: If the value "RunInvalidSignatures" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46625
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Download',
      }) do
        its('RunInvalidSignatures') { should eq 0 }
      end

# STOP_DESCRIBE V-46625

end

