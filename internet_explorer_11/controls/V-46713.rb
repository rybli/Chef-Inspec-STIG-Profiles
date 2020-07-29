# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46713 - Internet Explorer Processes for MIME handling must be enforced (iexplore).'
control 'V-46713' do
  impact 0.5
  title 'Internet Explorer Processes for MIME handling must be enforced (iexplore).'
  desc 'Internet Explorer uses Multipurpose Internet Mail Extensions (MIME) data to determine file handling procedures for files received through a web server. The Consistent MIME Handling\Internet Explorer Processes policy setting determines whether Internet Explorer requires all file-type information provided by web servers to be consistent. For example, if the MIME type of a file is text/plain but the MIME data indicates that the file is really an executable file, Internet Explorer changes its extension to reflect this executable status. This capability helps ensure that executable code cannot masquerade as other types of data that may be trusted. If you enable this policy setting, Internet Explorer examines all received files and enforces consistent MIME data for them. If you disable or do not configure this policy setting, Internet Explorer does not require consistent MIME data for all received files and will use the MIME data provided by the file. MIME file-type spoofing is a potential threat to an organization. Ensuring these files are consistent and properly labeled helps prevent malicious file downloads from infecting the network. This guide recommends configuring this policy as "Enabled" for all environments specified in this guide.'
  tag 'stig', 'V-46713'
  tag severity: 'medium'
  tag checkid: 'C-49855r2_chk'
  tag fixid: 'F-50469r1_fix'
  tag version: 'DTBI594-IE11'
  tag ruleid: 'SV-59577r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Consistent Mime Handling -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Consistent Mime Handling -> Internet Explorer Processes must be Enabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_HANDLING Criteria: If the value "iexplore.exe" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46713

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_HANDLING',
      }) do
       its(['iexplore.exe']) { should eq '1' }
      end

# STOP_DESCRIBE V-46713

end
