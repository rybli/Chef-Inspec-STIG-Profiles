# encoding: utf-8

control "V-52299" do
	title "The DBMS must employ cryptographic mechanisms to protect the integrity and confidentiality of non-local maintenance and diagnostic communications."
	desc "Non-local maintenance and diagnostic activities are those activities conducted by individuals communicating through a network, either an external network (e.g., the Internet) or an internal network. 

The act of managing systems and applications includes the ability to access sensitive application information, such as system configuration details, diagnostic information, user information, and potentially sensitive application data. 

When applications provide a remote management capability inherent to the application, the application needs to ensure the communication channels used to remotely access the system are adequately protected.  If the communication channel is not adequately protected authentication information, application data, and configuration information could be compromised.false"
	impact 0.5
	tag "check": "Review DBMS configuration to determine if cryptographic mechanisms are being utilized to protect the integrity and confidentiality of non-local maintenance and diagnostic communications. If not, this is a finding."
	tag "fix": "Configure DBMS to utilize cryptographic mechanisms to protect the integrity and confidentiality of non-local maintenance and diagnostic communications."

	# Write Check Logic Here

end