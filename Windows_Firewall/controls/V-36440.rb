# encoding: utf-8

control "V-36440" do
	title "Inbound exceptions to the firewall on domain workstations must only allow authorized remote management hosts."
	desc "Allowing inbound access to domain workstations from other systems may allow lateral movement across systems if credentials are compromised.  Limiting inbound connections only from authorized remote management systems will help limit this exposure.false"
	impact 0.5
	tag "check": "This requirement is NA for servers and non domain workstations.

Verify firewall exceptions for inbound connections on domain workstations only allow authorized management systems and remote management hosts.

Review inbound firewall exception rules in Windows Firewall with Advanced Security. Firewall rules can be complex and should be reviewed with the firewall administrator.

One method for restricting inbound connections is to only allow exceptions for a specific scope of remote IP addresses.

If allowed inbound exceptions are not limited to authorized management systems and remote management hosts, this is a finding."
	tag "fix": "Ensure firewall exceptions to inbound connections on domain workstations only allow authorized management systems and remote management hosts.

Firewall rules can be complex and should be thoroughly tested before applying in a production environment.

One method for restricting inbound connections is to only allow exceptions for a specific scope of remote IP addresses. For any inbound rules that allow connections from other systems, configure the Scope for Remote IP addresses to those of authorized management systems and remote management hosts. This may be defined as an IP address, subnet, or range. Apply the rule to all firewall profiles."

	# Write Check Logic Here
	is_domain = command('wmic computersystem get domain | FINDSTR /V Domain').stdout.strip
	if is_domain != 'WORKGROUP'
		describe 'Verify Inbound exceptions to the Windows Firewall.' do
			skip 'Inbound exceptions to the firewall on domain workstations must only allow authorized remote management hosts.'
		end
	else
		describe 'This system is not a member of a domain, the check is Not Applicable.' do
			skip 'This system is not a member of a domain, the check is Not Applicable.'
		end
	end
end