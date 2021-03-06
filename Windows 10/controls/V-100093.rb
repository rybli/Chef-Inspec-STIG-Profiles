# encoding: UTF-8

control "V-100093" do
  title "Windows 10 must cover or disable the built-in or attached camera when not in use."
  desc  "It is detrimental for operating systems to provide, or install by default, 
  functionality exceeding requirements or mission objectives. These unnecessary capabilities 
  or services are often overlooked and therefore may remain unsecured. They increase the risk 
  to the platform by providing additional attack vectors.

Failing to disconnect from collaborative computing devices (i.e. cameras) can result in 
subsequent compromises of organizational information. Providing easy methods to physically 
disconnect from such devices after a collaborative computing session helps to ensure that 
participants actually carry out the disconnect activity without having to go through complex 
and tedious procedures."
  impact 0.3
  tag severity: nil
  tag gtitle: "WN10-CC-000007"
  tag gid: "V-100093"
  tag rid: "SV-109197r1_rule"
  tag stig_id: "WN10-CC-000007"
  tag fix_id: "F-105247r1_fix"
  tag cci: ["CCI-000381"]
  tag nist: ["CM-7 a", "Rev_4"]
  desc  "rationale", ""
  desc  "check", "If the device or operating system does not have a camera installed, this 
  requirement is not applicable.

This requirement is not applicable to mobile devices (smartphones and tablets), 
where the use of the camera is a local AO decision.

This requirement is not applicable to dedicated VTC suites located in approved VTC 
locations that are centrally managed.

For an external camera, if there is not a method for the operator to manually disconnect 
camera at the end of collaborative computing sessions, this is a finding.

For a built-in camera, the camera must be protected by a camera 
cover (e.g. laptop camera cover slide) when not in use. If the built-in camera is not 
protected with a camera cover, or if the built-in
camera is not disabled in the bios, this is a finding.

If the camera is not disconnected or covered, the following registry entry is required:

Registry Hive: HKEY_LOCAL_MACHINE
RegistryPath\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\webcam

Value Name: Deny

If \"Value Name\" is set to a value other than \"Deny\" and the collaborative computing 
device has not been authorized for use, this is a finding."
  desc  "fix", "If the camera is not disconnected or covered, the following registry entry 
  is required.

Registry Hive: HKEY_LOCAL_MACHINE
RegistryPath\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\webcam

Value Name: Deny"
 
   describe registry_key('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam') do
      its('Value') { should eq 'Deny' }
   end
end
