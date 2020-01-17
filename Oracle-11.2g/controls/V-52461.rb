# encoding: utf-8

control "V-52461" do
	title "The DBMS must prevent the presentation of information system management-related functionality at an interface utilized by general (i.e., non-privileged) users."
	desc "Information system management functionality includes functions necessary to administer databases, network components, workstations, or servers, and typically requires privileged user access.

The separation of user functionality from information system management functionality is either physical or logical and is accomplished by using different computers, different central processing units, different instances of the operating system, different network addresses, combinations of these methods, or other methods, as appropriate.

An example of this type of separation is observed in web administrative interfaces that use separate authentication methods for users of any other information system resources. This may include isolating the administrative interface on a different domain and with additional access controls.

If administrative functionality or information regarding DBMS management is presented on an interface available for users, information on DBMS settings may be inadvertently made available to the user.false"
	impact 0.5
	tag "check": "Check DBMS settings and vendor documentation to verify administrative functionality is separate from user functionality. If administrator and general user functionality is not separated either physically or logically, this is a finding."
	tag "fix": "Configure DBMS settings to separate database administration and general user functionality.  Provide those who have both administrative and general-user  responsibilities with separate accounts for these separate functions."

	# Write Check Logic Here

end