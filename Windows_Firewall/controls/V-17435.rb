# encoding: utf-8

control "V-17435" do
	title "The Windows Firewall with Advanced Security log size must be configured for private network connections."
	desc "A firewall provides a line of defense against attack.  To be effective, it must be enabled and properly configured.  The firewall log file size for a private connection will be set  to ensure enough capacity is allocated for audit data.false"
	impact 0.5
	tag "check": "If the firewall's Private Profile is not enabled (see V-17416), this requirement is also a finding.

If the following policy-based registry value exists and is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile\\Logging\

Value Name:  LogFileSize

Type:  REG_DWORD
Value:  0x00004000 (16384) (or greater)

If the policy-based registry value does not exist, verify the following registry value. If it is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile\\Logging\

Value Name:  LogFileSize

Type:  REG_DWORD
Value:  0x00004000 (16384) (or greater)"
	tag "fix": "The preferred method of configuring the firewall settings is with a policy, particularly in a domain environment.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Logging (select Customize), 'Size limit (KB)' to '16,384' or greater.

In addition to using policies, systems may also be configured using the firewall GUI or Netsh commands.  These methods may be more appropriate for standalone systems.
The configuration settings in the GUI are the same as those specified in the policy above.  Windows Firewall Properties will be a link in the center pane after opening Windows Firewall with Advanced Security.

The following Netsh command may also be used to configure this setting:
'Netsh advfirewall set privateprofile logging maxfilesize 16384' or greater."

	# Write Check Logic Here
	# Check V-17416
	if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile').exists
		describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile') do
			its('EnableFirewall') { should eq 1 }
		end
	else
		describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile') do
			its('EnableFirewall') { should eq 1 }
		end
	end

	if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging').exists
		describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging') do
			its('LogFileSize') { should be >= 16384 }
		end
	else
		describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\Logging') do
			its('LogFileSize') { should be >= 16384 }
		end
	end

end