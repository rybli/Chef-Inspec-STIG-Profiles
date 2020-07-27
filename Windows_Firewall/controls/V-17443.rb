# encoding: utf-8

control "V-17443" do
	title "The Windows Firewall with Advanced Security local connection rules must not be merged with Group Policy settings when connected to a public network."
	desc "A firewall provides a line of defense against attack.  To be effective, it must be enabled and properly configured.  Local connection rules will not be merged with Group Policy settings on a public network to prevent Group Policy settings from being changed.false"
	impact 0.5
	tag "check": "If the system is not a member of a domain, this is NA.

If the firewall's Public Profile is not enabled (see V-17417), this requirement is also a finding.

Verify the registry value below.

If this registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\

Value Name:  AllowLocalIPsecPolicyMerge

Type:  REG_DWORD
Value:  0x00000000 (0)"
	tag "fix": "If the system is not a member of a domain, this is NA.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Public Profile Tab -> Settings (select Customize) -> Rule merging, 'Apply local connection security rules:' to 'No'."

	# Write Check Logic Here
	is_domain = command('wmic computersystem get domain | FINDSTR /V Domain').stdout.strip
	if is_domain != 'WORKGROUP'
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

		describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile') do
			it { should exist }
			it { should have_property 'AllowLocalIPsecPolicyMerge' }
			its('AllowLocalIPsecPolicyMerge') { should eq 0 }
		end
	else
		describe 'This system is not a member of a domain, the check is Not Applicable.' do
			skip 'This system is not a member of a domain, the check is Not Applicable.'
		end
	end

end