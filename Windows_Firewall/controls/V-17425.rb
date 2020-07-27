# encoding: utf-8

control "V-17425" do
	title "The Windows Firewall with Advanced Security log size must be configured for domain connections."
	desc "A firewall provides a line of defense against attack.  To be effective, it must be enabled and properly configured.  The firewall log file size for a domain connection will be set to ensure enough capacity is allocated for audit data.false"
	impact 0.5
	tag "check": "If the system is not a member of a domain, the Domain Profile requirements can be marked NA.

If the system is a member of a domain and the firewall's Domain Profile is not enabled (see V-17415), this requirement is also a finding.

If the following policy-based registry value exists and is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\Logging\

Value Name:  LogFileSize

Type:  REG_DWORD
Value:  0x00004000 (16384) (or greater)

If the policy-based registry value does not exist, verify the following registry value. If it is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\DomainProfile\Logging\

Value Name:  LogFileSize

Type:  REG_DWORD
Value:  0x00004000 (16384) (or greater)"
	tag "fix": "The preferred method of configuring the firewall settings is with a policy, particularly in a domain environment.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Logging (select Customize), 'Size limit (KB):' to '16,384' or greater.

In addition to using policies, systems may also be configured using the firewall GUI or Netsh commands.  These methods may be more appropriate for standalone systems.
The configuration settings in the GUI are the same as those specified in the policy above.  Windows Firewall Properties will be a link in the center pane after opening Windows Firewall with Advanced Security.

The following Netsh command may also be used to configure this setting:
'Netsh advfirewall set domainprofile logging maxfilesize 16384' or greater."

	# Write Check Logic Here
	is_domain = command('wmic computersystem get domain | FINDSTR /V Domain').stdout.strip
	if is_domain != 'WORKGROUP'
		# Check V-17415
		if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile').exists
			describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile') do 
				its('EnableFirewall') { should eq 1 }
			end
		else
			describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile') do
				its('EnableFirewall') { should eq 1 }
			end
		end

		if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging').exists
			describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging') do 
				its('LogFileSize') { should be >= 16384 }
			end
		else
			describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\Logging') do
				its('LogFileSize') { should be >= 16384 }
			end
		end
	else
		describe 'This system is not a member of a domain, the Domain Profile requirements is Not Applicable.' do
			skip 'This system is not a member of a domain, the Domain Profile requirements is Not Applicable.'
		end
	end

end