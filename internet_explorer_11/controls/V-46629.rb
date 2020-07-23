# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46629 - Checking for server certificate revocation must be enforced.'
control 'V-46629' do
  impact 0.3
  title 'Checking for server certificate revocation must be enforced.'
  desc 'This policy setting allows you to manage whether Internet Explorer will check revocation status of servers certificates. Certificates are revoked when they have been compromised or are no longer valid, and this option protects users from submitting confidential data to a site that may be fraudulent or not secure. If you enable this policy setting, Internet Explorer will check to see if server certificates have been revoked. If you disable this policy setting, Internet Explorer will not check server certificates to see if they have been revoked. If you do not configure this policy setting, Internet Explorer will not check server certificates to see if they have been revoked.'
  tag 'stig', 'V-46629'
  tag severity: 'low'
  tag checkid: 'C-49795r2_chk'
  tag fixid: 'F-50399r1_fix'
  tag version: 'DTBI365-IE11'
  tag ruleid: 'SV-59493r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Check for server certificate revocation to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Internet Control Panel -> Advanced Page -> Check for server certificate revocation must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings Criteria: If the value "CertificateRevocation" is REG_DWORD = 1, this is not a finding.'

# START_DESCRIBE V-46629
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings',
      }) do
        its('CertificateRevocation') { should eq 1 }
      end

# STOP_DESCRIBE V-46629

end

