# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46727 - Internet Explorer Processes for Zone Elevation must be enforced (Reserved).'
control 'V-46727' do
  impact 0.5
  title 'Internet Explorer Processes for Zone Elevation must be enforced (Reserved).'
  desc 'Internet Explorer places restrictions on each web page it opens that are dependent upon the location of the web page (such as Internet Zone, Intranet Zone, or Local Machine Zone). Web pages on a local computer have the fewest security restrictions and reside in the Local Machine Zone, which makes the Local Machine Security Zone a prime target for malicious attackers. If you enable this policy setting, any zone can be protected from zone elevation by Internet Explorer processes. This approach stops content running in one zone from gaining the elevated privileges of another zone. If you disable this policy setting, no zone receives such protection from Internet Explorer processes. Because of the severity and relative frequency of zone elevation attacks, this guide recommends that you configure this setting as "Enabled" in all environments.'
  tag 'stig', 'V-46727'
  tag severity: 'medium'
  tag checkid: 'C-49869r2_chk'
  tag fixid: 'F-50483r1_fix'
  tag version: 'DTBI610-IE11'
  tag ruleid: 'SV-59591r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Protection From Zone Elevation -> Internet Explorer Processes to Enabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Security Features -> Protection From Zone Elevation -> Internet Explorer Processes must be Enabled.  Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ZONE_ELEVATION Criteria: If the value "(Reserved)" is REG_SZ = 1, this is not a finding.'

# START_DESCRIBE V-46727

      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ZONE_ELEVATION',
      }) do
        its('(Reserved)') { should eq '1' }
      end

# STOP_DESCRIBE V-46727

end
