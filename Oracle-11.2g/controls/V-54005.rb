# encoding: utf-8

control "V-54005" do
	title "Application user privilege assignment must be reviewed monthly or more frequently to ensure compliance with least privilege and documented policy."
	desc "Users granted privileges not required to perform their assigned functions are able to make unauthorized modifications to the production data or database. Monthly or more frequent periodic review of privilege assignments assures that organizational and/or functional changes are reflected appropriately.false"
	impact 0.5
	tag "check": "Review policy, procedures and implementation evidence to determine if periodic reviews of user privileges by the IAO are being performed.

Evidence may consist of email or other correspondence that acknowledges receipt of periodic reports and notification of review between the DBA and IAO or other auditors as assigned.

If policy and procedures are incomplete or no evidence of implementation exists, this is a Finding."
	tag "fix": "Develop, document and implement policy and procedures for periodic review of database user accounts and privilege assignments.

Include methods to provide evidence of review in the procedures to verify reviews occur in accordance with the procedures."

	# Write Check Logic Here

end