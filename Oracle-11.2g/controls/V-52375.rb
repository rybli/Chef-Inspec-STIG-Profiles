# encoding: utf-8

control "V-52375" do
	title "The DBMS must be protected from unauthorized access by developers."
	desc "Applications employ the concept of least privilege for specific duties and information systems (including specific functions, ports, protocols, and services). The concept of least privilege is also applied to information system processes, ensuring that the processes operate at privilege levels no higher than necessary to accomplish required organizational missions and/or functions. Organizations consider the creation of additional processes, roles, and information system accounts as necessary to achieve least privilege. Organizations also apply least privilege concepts to the design, development, implementation, and operations of information systems.

Developers granted elevated database and/or operating system privileges on production databases can affect the operation and/or security of the database system. Operating system and database privileges assigned to developers on production systems must not be allowed.false"
	impact 0.5
	tag "check": "Check the production system to ensure no developer accounts have rights to modify the production database structure or alter production data.   

If developer accounts with these rights exist, ask for documentation that shows these accounts have formal approval and risk acceptance. If this documentation does not exist, this is a finding.

If developer accounts exist with the right to create and maintain tables (or other database objects) in production tablespaces, this is a finding."
	tag "fix": "Restrict developer privileges to production objects to only objects and data where those privileges are required and authorized.  Document the approval and risk acceptance.

Consider using separate accounts for a person's developer duties and production duties.  At a minimum, use separate roles for developer privileges and production privileges.

If developers need the ability to create and maintain tables (or other database objects) as part of their development activities, provide dedicated tablespaces, and revoke any rights that allowed them to use production tablespaces for this purpose."

	# Write Check Logic Here

end