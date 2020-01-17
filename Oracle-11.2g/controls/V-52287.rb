# encoding: utf-8

control "V-52287" do
	title "Procedures for establishing temporary passwords that meet DoD password requirements for new accounts must be defined, documented, and implemented."
	desc "Password maximum lifetime is  the maximum period of time, (typically in days) a user's password may be in effect before the user is forced to change it.

Passwords need to be changed at specific policy-based intervals as per policy. Any password, no matter how complex, can eventually be cracked.

One method of minimizing this risk is to use complex passwords and periodically change them. If the application does not limit the lifetime of passwords and force users to change their passwords, there is the risk that the system and/or application passwords could be compromised.

New accounts authenticated by passwords that are created without a password or with an easily guessed password are vulnerable to unauthorized access. Procedures for creating new accounts with passwords should include the required assignment of a temporary password to be modified by the user upon first use.

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP  With respect to Oracle, this requirement applies to cases where it is necessary to have accounts directly managed by Oracle.false"
	impact 0.5
	tag "check": "If all user accounts are authenticated by the OS or an enterprise-level authentication/access mechanism, and not by Oracle, stop here:  this is not a finding against the DBMS.

Where accounts are authenticated using passwords, review procedures and implementation evidence for creation of temporary passwords. If the procedures or evidence do not exist or do not enforce passwords to meet DoD password requirements, this is a finding."
	tag "fix": "Implement procedures for assigning temporary passwords to user accounts.

Procedures should include instructions to meet current DoD password length and complexity requirements and provide a secure method to relay the temporary password to the user."

	# Write Check Logic Here

end