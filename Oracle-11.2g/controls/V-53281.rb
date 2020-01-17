# encoding: utf-8

control "V-53281" do
	title "Processes (services, applications, etc.) that connect to the DBMS independently of individual users, must use valid, current DoD-issued PKI certificates for authentication to the DBMS."
	desc "Just as individual users must be authenticated, and just as they must use PKI-based authentication, so must any processes that connect to the DBMS.

The DoD standard for authentication of a process or device communicating with another process or device is the presentation of a valid, current, DoD-issued Public Key Infrastructure (PKI) certificate that has previously been verified as Trusted by an administrator of the other process or device.

This applies both to processes that run on the same server as the DBMS and to processes running on other computers.

The Oracle-supplied super-user account, SYS, is an exception.  It cannot currently use certificate-based authentication.  For this reason among others, use of SYS should be restricted to where it is truly needed.false"
	impact 0.5
	tag "check": "Review configuration to confirm that accounts used by processes to connect to the DBMS are authenticated using valid, current DoD-issued PKI certificates.

If any such account, other than SYS, is not certificate-based, this is a finding."
	tag "fix": "For each such account, use DoD certificate-based authentication."

	# Write Check Logic Here

end