# encoding: utf-8

control "V-92753" do
	title "The Apache web server must be configured in accordance with the security configuration settings based on DoD security configuration or implementation guidance, including STIGs, NSA configuration guides, CTOs, and DTMs."
	desc "Configuring the Apache web server to implement organization-wide security implementation guides and security checklists guarantees compliance with federal standards and establishes a common security baseline across the DoD that reflects the most restrictive security posture consistent with operational requirements.

Configuration settings are the set of parameters that can be changed that affect the security posture and/or functionality of the system. Security-related parameters are parameters impacting the security state of the Apache web server, including those required to satisfy other security control requirements.false"
	impact 0.5
	tag "check": "Review the website to determine if 'HTTP' and 'HTTPS' are used in accordance with well-known ports (e.g., 80 and 443) or those ports and services as registered and approved for use by the DoD Ports, Protocols, and Services Management (PPSM).

Verify that any variation in PPS is documented, registered, and approved by the PPSM.

If well-known ports and services are not approved for used by PPSM, this is a finding."
	tag "fix": "Ensure the website enforces the use of IANA well-known ports for 'HTTP' and 'HTTPS'."

	# Write Check Logic Here

end