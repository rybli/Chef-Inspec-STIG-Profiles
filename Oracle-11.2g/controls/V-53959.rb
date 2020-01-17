# encoding: utf-8

control "V-53959" do
	title "Audit trail data must be retained for one year."
	desc "Without preservation, a complete discovery of an attack or suspicious activity may not be determined.  DBMS audit data also contributes to the complete investigation of unauthorized activity and needs to be included in audit retention plans and procedures.false"
	impact 0.5
	tag "check": "Review and verify the implementation of an audit trail retention policy.

Verify that audit data is maintained for a minimum of one year.

If audit data is not maintained for a minimum of one year, this is a Finding."
	tag "fix": "Develop, document and implement an audit retention policy and procedures.

It is recommended that the most recent thirty days of audit logs remain available online.

After thirty days, the audit logs may be maintained offline.

Online maintenance provides for a more timely capability and inclination to investigate suspicious activity."

	# Write Check Logic Here

end