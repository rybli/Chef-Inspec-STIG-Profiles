# encoding: utf-8

control "V-75031" do
	title "The DBMS must use multifactor authentication for local access to non-privileged accounts."
	desc "Multifactor authentication is defined as using two or more factors to achieve authentication. 

Factors include: 
(i) Something a user knows (e.g., password/PIN); 
(ii) Something a user has (e.g., cryptographic identification device, token); or 
(iii) Something a user is (e.g., biometric). 

A non-privileged account is defined as an information system account with authorizations of a regular or non-privileged user. 

Local Access is defined as access to an organizational information system by a user (or process acting on behalf of a user) communicating through a direct connection without the use of a network.

The lack of multifactor authentication makes it much easier for an attacker to gain unauthorized access to a system.false"
	impact 0.5
	tag "check": "Review DBMS settings, OS settings, and/or enterprise-level authentication/access mechanism settings to determine whether users logging in to non-privileged accounts locally are required to use multifactor authentication. If users logging into non-privileged accounts locally are not required to use multifactor authentication, this is a finding.

Authentication is used to prove the identities of users who are attempting to log in to the database. Authenticating user identity is imperative in distributed environments, without which there can be little confidence in network security. Passwords are the most common means of authentication. Oracle Database enables strong authentication with Oracle authentication adapters that support various third-party authentication services, including TLS with digital certificates.

If the $ORACLE_HOME/network/admin/sqlnet.ora contains entries similar to the following, TLS is enabled.
(Note: This assumes that a single sqlnet.ora file, in the default location, is in use. Please see the supplemental file "Non-default sqlnet.ora configurations.pdf" for how to find multiple and/or differently located sqlnet.ora files.)

SQLNET.AUTHENTICATION_SERVICES= (BEQ, TCPS)
SSL_VERSION = 1.2
SSL_CLIENT_AUTHENTICATION = TRUE
WALLET_LOCATION =
  (SOURCE =
    (METHOD = FILE)
    (METHOD_DATA =
      (DIRECTORY = /u01/app/oracle/product/11.2.0/dbhome_1/owm/wallets)
    )
  )
SSL_CIPHER_SUITES= (<cipher suite name>)
ADR_BASE = /u01/app/oracle"
	tag "fix": "Configure DBMS, OS, and/or enterprise-level authentication/access mechanism to require multifactor authentication for local users logging in to non-privileged accounts.

If appropriate, enable support for Transport Layer Security (TLS) protocols and multifactor authentication through the use of smart cards (CAC/PIV)."

	# Write Check Logic Here

end