# encoding: utf-8

control "V-92749" do
	title "The Apache web server must install security-relevant software updates within the configured time period directed by an authoritative source (e.g., IAVM, CTOs, DTMs, and STIGs)."
	desc "Security flaws with software applications are discovered daily. Vendors are constantly updating and patching their products to address newly discovered security vulnerabilities. Organizations (including any contractor to the organization) are required to promptly install security-relevant software updates (e.g., patches, service packs, and hot fixes). Flaws discovered during security assessments, continuous monitoring, incident response activities, or information system error handling must also be addressed expeditiously.

The Apache web server will be configured to check for and install security-relevant software updates from an authoritative source within an identified time period from the availability of the update. By default, this time period will be every 24 hours.false"
	impact 0.5
	tag "check": "Determine the most recent patch level of the Apache Web Server 2.4 software, as posted on the Apache HTTP Server Project website.

In a command line, type 'httpd -v'.

If the version is more than one version behind the most recent patch level, this is a finding."
	tag "fix": "Install the current version of the web server software and maintain appropriate service packs and patches."

	# Write Check Logic Here
	describe package('httpd') do
		its('version') { should cmp >= 'httpd-2.4.6-90.el7.x86_64' }
	end

end
