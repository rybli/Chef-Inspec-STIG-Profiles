# encoding: utf-8

control "V-52371" do
	title "The DBMS must restrict grants to sensitive information to authorized user roles."
	desc "Applications employ the concept of least privilege for specific duties and information systems (including specific functions, ports, protocols, and services). The concept of least privilege is also applied to information system processes, ensuring that the processes operate at privilege levels no higher than necessary to accomplish required organizational missions and/or functions. Organizations consider the creation of additional processes, roles, and information system accounts as necessary to achieve least privilege. Organizations also apply least privilege concepts to the design, development, implementation, and operations of information systems.

Unauthorized access to sensitive data may compromise the confidentiality of personnel privacy, threaten national security, or compromise a variety of other sensitive operations. Access controls are best managed by defining requirements based on distinct job functions and assigning access based on the job function assigned to the individual user.false"
	impact 0.5
	tag "check": "Obtain a list of privileges assigned to user accounts. If access to sensitive information is granted to roles not authorized to access sensitive information, this is a finding.

If access to sensitive information is granted to individual accounts rather than to a role, this is a finding."
	tag "fix": "Define application user roles based on privilege and job function requirements. 

Assign the required privileges to the role and assign the role to authorized application user accounts.

Revoke any privileges to sensitive information directly assigned to application user accounts."

	# Write Check Logic Here

end