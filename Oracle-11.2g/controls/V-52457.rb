# encoding: utf-8

control "V-52457" do
	title "A DBMS utilizing Discretionary Access Control (DAC) must enforce a policy that includes or excludes access to the granularity of a single user."
	desc "DAC is based on the notion that individual users are "owners" of objects and therefore have discretion over who should be authorized to access the object and in which mode (e.g., read or write). Ownership is usually acquired as a consequence of creating the object or via specified ownership assignment.

DAC allows the owner to determine who will have access to objects they control. An example of DAC includes user-controlled file permissions.

Including or excluding access to the granularity of a single user means providing the capability to either allow or deny access to objects (e.g., files, folders) on a per single user basis.

Databases using DAC must have the ability for the owner of an object or information to assign or revoke rights to view or modify the object or information.  If the owner of an object or information does not have rights to exclude access to an object or information at a user level, users may gain access to objects and information they are not authorized to view/modify.false"
	impact 0.5
	tag "check": "Check DBMS settings and documentation to determine if users are able to assign and revoke rights to the objects and information they own. If users cannot assign or revoke rights to the objects and information they own to the granularity of a single user, this is a finding.

(This is default Oracle behavior.)"
	tag "fix": "Modify DBMS settings to allow users to assign or revoke access rights to objects and information owned by the user. The ability to grant or revoke rights must include the ability to grant or revoke those rights down to the granularity of a single user. 

(This is default Oracle behavior.)"

	# Write Check Logic Here

end