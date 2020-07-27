# encoding: utf-8

control "V-17439" do
	title "The Windows Firewall with Advanced Security must allow outbound connections, unless a rule explicitly blocks the connection when connected to a public network."
	desc "A firewall provides a line of defense against attack.  To be effective, it must be enabled and properly configured.  Outbound connections are allowed on a public network, unless a rule explicitly blocks the connection.  This allows normal outbound communication, which could be restricted as necessary with additional rules.false"
	impact 0.5
	tag "check": "If the firewall's Public Profile is not enabled (see V-17417), this requirement is also a finding.

If the following policy-based registry value exists and is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\

Value Name:  DefaultOutboundAction

Type:  REG_DWORD
Value:  0x00000000 (0)

If the policy-based registry value does not exist, verify the following registry value. If it is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\PublicProfile\

Value Name:  DefaultOutboundAction

Type:  REG_DWORD
Value:  0x00000000 (0)"
	tag "fix": "The preferred method of configuring the firewall settings is with a policy, particularly in a domain environment.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Public Profile Tab -> State, 'Outbound connections' to 'Allow (default)'.

In addition to using policies, systems may also be configured using the firewall GUI or Netsh commands.  These methods may be more appropriate for standalone systems.
The configuration settings in the GUI are the same as those specified in the policy above.  Windows Firewall Properties will be a link in the center pane after opening Windows Firewall with Advanced Security.

The following Netsh commands may also be used to configure this setting:
'Netsh advfirewall set publicprofile firewallpolicy blockinbound,allowoutbound'.
Or
'Netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound'.
Both inbound and outbound parameters must be specified to execute this command."

	# Write Check Logic Here
	# Check V-17417
	if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile').exists
		describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile') do
			its('EnableFirewall') { should eq 1 }
		end
	else
		describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile') do
			its('EnableFirewall') { should eq 1 }
		end
	end

	if registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile').exists
		describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile') do
			its('DefaultInboundAction') { should eq 1 }
		end
	else
		describe registry_key('HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile') do
			its('DefaultInboundAction') { should eq 1 }
		end
	end

end