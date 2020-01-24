# encoding: utf-8

control "V-92643" do
	title "The Apache web server must not be a proxy server."
	desc "A web server should be primarily a web server or a proxy server but not both, for the same reasons that other multi-use servers are not recommended. Scanning for web servers that will also proxy requests into an otherwise protected network is a very common attack, making the attack anonymous.false"
	impact 0.5
	tag "check": "If the server is a proxy server and not a web server, this check is Not Applicable.

In a command line, run 'httpd -M | sort' to view a list of installed modules.

If any of the following modules are present, this is a finding:

proxy_module
proxy_ajp_module
proxy_balancer_module
proxy_ftp_module
proxy_http_module
proxy_connect_module
Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:
# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the directive 'ProxyRequest' in the 'httpd.conf' file.
If the ProxyRequest directive is set to “On”, this is a finding.
"
	tag "fix": "Determine where the proxy modules are located by running the following command:

grep -rl 'proxy_module' <'INSTALL PATH'>

Edit the file and comment out the following modules:

proxy_module
proxy_ajp_module
proxy_balancer_module
proxy_ftp_module
proxy_http_module
proxy_connect_module
Comment out the ProxyRequext directive in the httpd.conf file.

Restart Apache: apachectl restart
"

	# Write Check Logic Here
	describe apache_conf() do
		its('ProxyRequest') { should eq 'Off' }
	end
	describe command('httpd -M | grep -i "proxy_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "proxy_ajp_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "proxy_balancer_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "proxy_ftp_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "proxy_http_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "proxy_connect_module"') do
		its('stdout') { should eq '' }
	end
end
