# encoding: utf-8

control "V-92659" do
	title "The Apache web server must have Web Distributed Authoring (WebDAV) disabled."
	desc "A web server can be installed with functionality that, by its nature, is not secure. WebDAV is an extension to the HTTP protocol that, when developed, was meant to allow users to create, change, and move documents on a server, typically a web server or web share. Allowing this functionality, development, and deployment is much easier for web authors.

WebDAV is not widely used and has serious security concerns because it may allow clients to modify unauthorized files on the web server.false"
	impact 0.5
	tag "check": "In a command line, run 'httpd -M | sort' to view a list of installed modules.

If any of the following modules are present, this is a finding:

dav_module
dav_fs_module
dav_lock_module"
	tag "fix": "Determine where the 'dav' modules are located by running the following command:

grep -rl 'dav_module' <'INSTALL PATH'>

Edit the file and comment out the following modules:

dav_module
dav_fs_module
dav_lock_module

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe command('httpd -M | grep -i "dav_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "dav_fs_module"') do
		its('stdout') { should eq '' }
	end
	describe command('httpd -M | grep -i "dav_lock_module"') do
		its('stdout') { should eq '' }
	end
end
