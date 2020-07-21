# encoding: UTF-8

control "V-102611" do
  title "Windows 10 non-persistent VM sessions should not exceed 24 hours."
  desc "For virtual desktop implementations (VDIs) where the virtual desktop instance 
  is deleted or refreshed upon logoff, the organization should enforce that sessions be 
  terminated within 24 hours. This would ensure any data stored on the VM that is not 
  encrypted or covered by Credential Guard is deleted."
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-00-000250"
  tag gid: "V-102611"
  tag rid: "SV-111557r1_rule"
  tag stig_id: "WN10-00-000250"
  tag fix_id: ""
  tag cci: ["CCI-001199"]
  tag nist: ["SC-28", "Rev_4"]
  desc  "rationale", ""
  desc  "check", "Ensure there is a documented policy or procedure in place that 
  non-persistent VM sessions do not exceed 24 hours.

If there is no such documented policy or procedure in place, this is a finding."
  desc  "fix", "Set non-persistent VM sessions to not exceed 24 hours."
 
   # Need Logic
end
