# encoding: utf-8

control "V-92671" do
	title "Apache web server accounts accessing the directory tree, the shell, or other operating system functions and utilities must only be administrative accounts."
	desc "As a rule, accounts on a web server are to be kept to a minimum. Only administrators, web managers, developers, auditors, and web authors require accounts on the machine hosting the web server. The resources to which these accounts have access must also be closely monitored and controlled. Only the system administrator needs access to all the system's capabilities, while the web administrator and associated staff require access and control of the web content and web server configuration files.false"
	impact 0.5
	tag "check": "Review the web server documentation and configuration to determine what web server accounts are available on the server.

Any directories or files owned by anyone other than an administrative service account is a finding. 

If non-privileged web server accounts are available with access to functions, directories, or files not needed for the role of the account, this is a finding."
	tag "fix": "Limit the functions, directories, and files that are accessible by each account and role to administrative service accounts and remove or modify non-privileged account access."

	# Write Check Logic Here

end