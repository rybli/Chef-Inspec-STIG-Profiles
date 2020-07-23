# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2016-09-16
# description: The Microsoft Internet Explorer 11 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems. Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil
# impacts
title 'V-46829 - Browser must retain history on exit.'
control 'V-46829' do
  impact 0.5
  title 'Browser must retain history on exit.'
  desc 'Delete Browsing History on exit automatically deletes specified items when the last browser window closes.  Disabling this function will prevent users from deleting their browsing history, which could be used to identify malicious websites and files that could later be used for anti-virus and Intrusion Detection System (IDS) signatures.  Furthermore, preventing users from deleting browsing history could be used to identify abusive web surfing on government systems.'
  tag 'stig', 'V-46829'
  tag severity: 'medium'
  tag checkid: 'C-49915r2_chk'
  tag fixid: 'F-50573r1_fix'
  tag version: 'DTBI760-IE11'
  tag ruleid: 'SV-59695r1_rule'
  tag fixtext: 'Set the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Allow deleting browsing history on exit to Disabled.   '
  tag checktext: 'The policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Internet Explorer -> Delete Browsing History -> Allow deleting browsing history on exit must be Disabled. Procedure: Use the Windows Registry Editor to navigate to the following key: HKLM\Software\Policies\Microsoft\Internet Explorer\Privacy Criteria: If the value "ClearBrowsingHistoryOnExit" is REG_DWORD = 0, this is not a finding.'

# START_DESCRIBE V-46829
  
      describe registry_key({
        hive: 'HKLM',
        key:  'Software\Policies\Microsoft\Internet Explorer\Privacy',
      }) do
        its('ClearBrowsingHistoryOnExit') { should eq 0 }
      end

# STOP_DESCRIBE V-46829

end

