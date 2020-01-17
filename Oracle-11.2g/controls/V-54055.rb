# encoding: utf-8

control "V-54055" do
	title "Remote DBMS administration must be documented and authorized or disabled."
	desc "Remote administration may expose configuration and sensitive data to unauthorized viewing during transit across the network or allow unauthorized administrative access to the DBMS to remote users.

For the purposes of this STIG, "Remote" means "outside the DoDIN." However, use of an approved and properly configured VPN counts as inside the DoDIN.false"
	impact 0.5
	tag "check": "Review the System Security Plan for authorization, assignments and usage procedures for remote DBMS administration.

If remote administration of the DBMS is not documented or poorly documented, this is a Finding.

If remote administration of the DBMS is not authorized and not disabled, this is a Finding.

If remote administration is to be performed from outside the DoDIN, but is not done via an approved and properly configured VPN, this is a finding."
	tag "fix": "Disable remote administration of the DBMS where not required.

Where remote administration of the DBMS is required, develop, document and implement policy and procedures on its use.

Where remote administration is to be performed from outside the DoDIN, configure an approved VPN client for this purpose.

Assign remote administration privileges to ISSO-authorized personnel only.

Document assignments in the System Security Plan."

	# Write Check Logic Here

end