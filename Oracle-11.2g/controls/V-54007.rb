# encoding: utf-8

control "V-54007" do
	title "Audit trail data must be reviewed daily or more frequently."
	desc "Review of audit trail data provides a means for detection of unauthorized access or attempted access. Frequent and regularly scheduled reviews ensure that such access is discovered in a timely manner.false"
	impact 0.5
	tag "check": "If the database being reviewed is not a production database, this check is Not a Finding.

Review policy and procedures documented or noted in the System Security plan as well as evidence of implementation for daily audit trail monitoring.  

If policy and procedures are not documented or evidence of implementation is not available, this is a Finding."
	tag "fix": "Develop, document and implement policy and procedures to monitor audit trail data daily."

	# Write Check Logic Here

end