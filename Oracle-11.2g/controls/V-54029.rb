# encoding: utf-8

control "V-54029" do
	title "Plans and procedures for testing DBMS installations, upgrades and patches must be defined and followed prior to production implementation."
	desc "Updates and patches to existing software have the intention of improving the security or enhancing or adding features to the product. However, it is unfortunately common that updates or patches can render production systems inoperable or even introduce serious vulnerabilities. Some updates also set security configurations back to unacceptable settings that do not meet security requirements. For these reasons, it is a good practice to test updates and patches offline before introducing them in a production environment.false"
	impact 0.5
	tag "check": "Review policy and procedures documented or noted in the System Security Plan and evidence of implementation for testing DBMS installations, upgrades and patches prior to production deployment.

If policy and procedures do not exist or evidence of implementation does not exist, this is a Finding."
	tag "fix": "Develop, document and implement procedures for testing DBMS installations, upgrades and patches prior to deployment on production systems."

	# Write Check Logic Here

end