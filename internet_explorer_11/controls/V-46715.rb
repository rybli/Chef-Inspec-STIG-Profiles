# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46715 - Internet Explorer Processes for MIME sniffing must be enforced (Reserved).'
control 'V-46715' do
  impact 0.5
  title 'Internet Explorer Processes for MIME sniffing must be enforced (Reserved).'
  desc 'MIME sniffing is the process of examining the content of a MIME file to determine its context - whether it is a data file, an executable file, or some other type of file. This policy setting determines whether Internet Explorer MIME sniffing will prevent promotion of a file of one type to a more dangerous file type. When set to "Enabled", MIME sniffing will never promote a file of one type to a more dangerous file type. Disabling MIME sniffing configures Internet Explorer processes to allow a MIME sniff that promotes a file of one type to a more dangerous file type. For example, promoting a text file to an executable file is a dangerous promotion because any code in the supposed text file would be executed. MIME file-type spoofing is a potential threat to an organization. Ensuring these files are consistently handled helps prevent malicious file downloads from infecting the network. This guide recommends you configure this policy as "Enabled" for all environments specified in this guide. Note: This setting works in conjunction with, but does not replace, the Consistent MIME Handling settings.'
  tag 'stig', 'V-46715'
  tag severity: 'medium'
  tag checkid: 'C-49857r2_chk'
  tag fixid: 'F-50471r1_fix'
  tag version: 'DTBI595-IE11'
  tag ruleid: 'SV-59579r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Mime Sniffing Safety Feature -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Mime Sniffing Safety Feature -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_SNIFFING Criteria: If the value "(Reserved)" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46715

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_SNIFFING',
      }) do
        its('(Reserved)') { should eq '1' }
      end

# STOP_DESCRIBE V-46715

end
