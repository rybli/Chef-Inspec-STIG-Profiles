# encoding: utf-8

control "V-92709" do
	title "The Apache web server must restrict inbound connections from nonsecure zones."
	desc "Remote access to the Apache web server is any access that communicates through an external, non-organization-controlled network. Remote access can be used to access hosted applications or to perform management functions.

A web server can be accessed remotely and must be capable of restricting access from what the DoD defines as nonsecure zones. Nonsecure zones are defined as any IP, subnet, or region that is defined as a threat to the organization. The nonsecure zones must be defined for public web servers logically located in a DMZ, as well as private web servers with perimeter protection devices. By restricting access from nonsecure zones, through the internal web server access list, the Apache web server can stop or slow denial-of-service (DoS) attacks on the web server.false"
	impact 0.5
	tag "check": "If external controls such as host-based firewalls are used to restrict this access, this check is Not Applicable.

Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the 'RequireAll' directive:

# cat /<path_to_file>/httpd.conf | grep -i 'RequireAll'

If 'RequireAll' is not configured or IP ranges configured to allow are not restrictive enough to prevent connections from nonsecure zones, this is a finding."
	tag "fix": "Configure the 'http.conf' file to include restrictions.

Example:

<RequireAll>
Require not ip 192.168.205
Require not host phishers.example.com
</RequireAll>"

	# Write Check Logic Here

end