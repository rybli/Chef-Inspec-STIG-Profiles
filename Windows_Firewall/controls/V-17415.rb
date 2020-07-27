# encoding: utf-8

control "V-17415" do
	title "The Windows Firewall with Advanced Security must be enabled when connected to a domain."
	desc "A firewall provides a line of defense against attack.  To be effective, it must be enabled and properly configured.  This setting enables the firewall when connected to the domain.false"
	impact 0.5
	tag "check": "If the system is not a member of a domain, the Domain Profile requirements can be marked NA.

If the following policy-based registry value exists and is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\

Value Name:  EnableFirewall

Type:  REG_DWORD
Value:  0x00000001 (1)

If the policy-based registry value does not exist, verify the following registry value.  If it is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\DomainProfile\

Value Name:  EnableFirewall

Type:  REG_DWORD
Value:  0x00000001 (1)"
	tag "fix": "The preferred method of configuring the firewall settings is with a policy, particularly in a domain environment.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, 'Firewall state' to 'On (recommended)'.

In addition to using policies, systems may also be configured using the firewall GUI or Netsh commands.  These methods may be more appropriate for standalone systems.
The configuration settings in the GUI are the same as those specified in the policy above.  Windows Firewall Properties will be a link in the center pane after opening Windows Firewall with Advanced Security.

The following Netsh commands may also be used to configure this setting:
'Netsh advfirewall set domainprofile state on'.
Or
'Netsh advfirewall set allprofiles state on'."

	# Write Check Logic Here
	is_domain = command('wmic computersystem get domain | FINDSTR /V Domain').stdout.strip
	if is_domain != 'WORKGROUP'
		if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile').exists
			describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile') do 
				its('EnableFirewall') { should eq 1 }
			end
		else
			describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile') do
				its('EnableFirewall') { should eq 1 }
			end
		end
	else
		describe 'This system is not a member of a domain, the Domain Profile requirements is Not Applicable.' do
			skip 'This system is not a member of a domain, the Domain Profile requirements is Not Applicable.'
		end
	end
end