# encoding: utf-8

control "V-52367" do
	title "The DBMS must enforce Discretionary Access Control (DAC) policy allowing users to specify and control sharing by named individuals, groups of individuals, or by both, limiting propagation of access rights and includes or excludes access to the granularity of a single user."
	desc "Access control policies (e.g., identity-based policies, role-based policies, attribute-based policies) and access enforcement mechanisms (e.g., access control lists, access control matrices, cryptography) are employed by organizations to control access between users (or processes acting on behalf of users) and objects (e.g., devices, files, records, processes, programs, domains). 

DAC is a type of access control methodology serving as a means of restricting access to objects and data based on the identity of subjects and/or groups to which they belong. It is discretionary in the sense that application users with the appropriate permissions to access an application resource or data have the discretion to pass that permission on to another user either directly or indirectly.

Data protection requirements may result in a DAC policy being specified as part of the application design. Discretionary access controls would be employed at the application level to restrict and control access to application objects and data thereby providing increased information security for the organization.  

When DAC controls are employed, those controls must limit sharing to named application users, groups of users, or both. The application DAC controls must also limit the propagation of access rights and have the ability to exclude access to data down to the granularity of a single user.

Databases using DAC must have the ability for the owner of an object or information to assign or revoke rights to view or modify the object or information.  If the owner of an object or information does not have rights to exclude access to an object or information at a user level, users may gain access to objects and information they are not authorized to view/modify.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine if users are able to assign and revoke rights to the objects and information that they own. If users cannot assign or revoke rights to the objects and information that they own to groups, roles, or individual users, this is a finding."
	tag "fix": "Modify DBMS settings to allow users to assign or revoke access rights to objects and information owned by the user. The ability to grant or revoke rights must include the ability to grant or revoke those rights down to the granularity of a single user.

(Note:  in most cases no fix will be necessary.  This is default functionality for Oracle.)"

	# Write Check Logic Here

end