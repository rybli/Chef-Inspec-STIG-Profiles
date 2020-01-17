# encoding: utf-8

control "V-52229" do
	title "The DBMS must enforce requirements for remote connections to the information system."
	desc "Applications that provide remote access to information systems must be able to enforce remote access policy requirements or work in conjunction with enterprise tools designed to enforce policy requirements. Examples of policy requirements include, but are not limited to, authorizing remote access to the information system, limiting access based on authentication credentials, and monitoring for unauthorized access. 

If databases allowing remote connections do not enforce requirements for remote access, an attacker may gain access to the database and may, through the database, gain access to other components of the information system.true"
	impact 0.5
	tag "check": "Review organization's access control policies and procedures addressing remote access to the information system. 

If remote connections are not allowed by the organization, this is NA.  (Note that "remote" means "from outside the DoD Information Network (DoDIN)", and that connections via approved Virtual Private Networks (VPNs) are considered to be inside the DoDIN.)

Review the DBMS, OS and/or enterprise account management settings to verify access controls and auditing settings exist and they enforce the requirements for remote access defined by the organization.  If access controls and auditing do not exist or do not fully enforce the requirements defined in the organization's policies and procedures, this is a finding.
"
	tag "fix": "
Configure DBMS settings to ensure access control and auditing requirements for remote connections are enforced by the DBMS.
"

	# Write Check Logic Here

end