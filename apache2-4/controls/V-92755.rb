# encoding: utf-8

control "V-92755" do
	title "The Apache web server software must be a vendor-supported version."
	desc "Many vulnerabilities are associated with older versions of web server software. As hot fixes and patches are issued, these solutions are included in the next version of the server software. Maintaining the web server at a current version makes the efforts of a malicious user to exploit the web service more difficult.false"
	impact 0.5
	tag "check": "Determine the version of the Apache software that is running on the system by entering the following command:

httpd -v

If the version of Apache is not at the following version or higher, this is a finding:

Apache 2.4 (February 2012)

NOTE: In some situations, the Apache software that is being used is supported by another vendor, such as Oracle in the case of the Oracle Application Server or IBM's HTTP Server. The versions of the software in these cases may not match the version number noted above. If the site can provide vendor documentation showing the version of the web server is supported, this would not be a finding."
	tag "fix": "Install the current version of the web server software and maintain appropriate service packs and patches."

	# Write Check Logic Here
	describe package(httpd) do
		its('version') { should match /httpd-2\.[4-9].*/ }
	end

end
