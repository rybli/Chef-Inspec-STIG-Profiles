# encoding: utf-8

control "V-52271" do
	title "The DBMS must support organizational requirements to enforce minimum password length."
	desc "Password complexity, or strength, is a measure of the effectiveness of a password in resisting attempts at guessing and brute-force attacks. 

To meet password policy requirements, passwords need to be changed at specific policy-based intervals.  

If the information system or application allows the user to consecutively reuse their password when that password has exceeded its defined lifetime, the end result is a password that is not changed as per policy requirements. 

Weak passwords are a primary target for attack to gain unauthorized access to databases and other systems. Where username/password is used for identification and authentication to the database, requiring the use of strong passwords can help prevent simple and more sophisticated methods for guessing at passwords.

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP  This requirement applies to cases where it is necessary to have accounts directly managed by Oracle.

false"
	impact 0.5
	tag "check": "If all user accounts are authenticated by the OS or an enterprise-level authentication/access mechanism, and not by Oracle, stop here:  this is not a finding against the DBMS.

For each profile that can be applied to accounts where authentication is under Oracle's control, determine the password verification function, if any, that is in use:

SELECT * FROM SYS.DBA_PROFILES 
WHERE RESOURCE_NAME = 'PASSWORD_VERIFY_FUNCTION'
[AND PROFILE NOT IN (<list of non-applicable profiles>)]
ORDER BY PROFILE;
Bearing in mind that a profile can inherit from another profile, and the root profile is called DEFAULT, determine the name of the password verification function effective for each profile.

If, for any profile, the function name is null, this is a finding.  

For each password verification function, examine its source code.  If it does not enforce the DoD-defined minimum length (15 unless otherwise specified), this is a finding.
"
	tag "fix": "If all user accounts are authenticated by the OS or an enterprise-level authentication/access mechanism, and not by Oracle, no fix to the DBMS is required.

If any user accounts are managed by Oracle:  Develop, test and implement a password verification function that enforces DoD requirements.

(Oracle supplies a sample function called verify_function_11G, in the script file 
<oracle_home>/RDBMS/ADMIN/utlpwdmg.sql.  This can be used as the starting point for a customized function.)"

	# Write Check Logic Here

end