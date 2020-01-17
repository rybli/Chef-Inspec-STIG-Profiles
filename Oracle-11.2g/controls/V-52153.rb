# encoding: utf-8

control "V-52153" do
	title "The DBMS must employ automated mechanisms to alert security personnel of inappropriate or unusual activities with security implications."
	desc "Applications will typically utilize logging mechanisms for maintaining a historical log of activity that occurs within the application. This information can then be used for diagnostic purposes, forensics purposes, or other purposes relevant to ensuring the availability and integrity of the application.

While it is important to log events identified as being critical and relevant to security, it is equally important to notify the appropriate personnel in a timely manner, so they are able to respond to events as they occur.

Solutions that include a manual notification procedure do not offer the reliability and speed of an automated notification solution. Applications must employ automated mechanisms to alert security personnel of inappropriate or unusual activities that have security implications. If this capability is not built directly into the application, the application must be able to integrate with existing security infrastructure that provides this capability.

Database management systems that do not automatically alert security personnel of unusual activities run the risk of security incidents going unnoticed for long periods of time. This can allow security breaches to be ongoing and more serious.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether security personnel are alerted automatically when unusual or security-related activities (threats identified by authoritative sources (e.g. CTOs) and IAW  with CJCSM 6510.01A) are detected on the database. If security personnel are not automatically alerted, this is a finding."
	tag "fix": "Configure database to automatically alert security personnel of inappropriate or unusual activities with security implications.

Oracle provides this capability with the Audit Vault.  Install and configure Oracle Audit Vault if it is available.

If Audit Vault is not available, implement custom code or deploy a third-party product to satisfy this requirement."

	# Write Check Logic Here

end