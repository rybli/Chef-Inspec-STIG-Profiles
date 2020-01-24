# encoding: utf-8

control "V-92673" do
	title "Apache web server application directories,  libraries, and configuration files must only be accessible to privileged users."
	desc "To properly monitor the changes to the web server and the hosted applications, logging must be enabled. Along with logging being enabled, each record must properly contain the changes made and the names of those who made the changes.

Allowing anonymous users the capability to change the web server or the hosted application will not generate proper log information that can then be used for forensic reporting in the case of a security issue. Allowing anonymous users to make changes will also grant change capabilities to anybody without forcing a user to authenticate before the changes can be made.

"
	impact 0.5
	tag "check": "Obtain a list of the user accounts for the system, noting the privileges for each account.

Verify with the SA or the Information System Security Officer (ISSO) that all privileged accounts are mission essential and documented.

Verify with the SA or the ISSO that all non-administrator access to shell scripts and operating system functions are mission essential and documented.

If undocumented privileged accounts are present, this is a finding.

If undocumented access to shell scripts or operating system functions is present, this is a finding."
	tag "fix": "Ensure non-administrators are not allowed access to the directory tree, the shell, or other operating system functions and utilities."

	# Write Check Logic Here

end