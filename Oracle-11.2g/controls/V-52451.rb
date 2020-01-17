# encoding: utf-8

control "V-52451" do
	title "The DBMS must uniquely identify and authenticate organizational users (or processes acting on behalf of organizational users)."
	desc "To assure accountability and prevent unauthorized access, organizational users shall be identified and authenticated. 

Organizational users include organizational employees or individuals the organization deems to have equivalent status of employees (e.g., contractors, guest researchers, individuals from allied nations). 

Users (and any processes acting on behalf of users) are uniquely identified and authenticated for all accesses other than those accesses explicitly identified and documented by the organization which outlines specific user actions that can be performed on the information system without identification or authentication.false"
	impact 0.5
	tag "check": "Review DBMS settings, OS settings, and/or enterprise-level authentication/access mechanism settings, and site practices, to determine whether organizational users are uniquely identified and authenticated when logging onto the system. If organizational users are not uniquely identified and authenticated, this is a finding."
	tag "fix": "Configure DBMS, OS and/or enterprise-level authentication/access mechanism to uniquely identify and authenticate all organizational users who log onto the system.  Ensure that each user has a separate account from all other users.

(This is the default behavior of Oracle.)"

	# Write Check Logic Here

end