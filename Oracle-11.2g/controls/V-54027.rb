# encoding: utf-8

control "V-54027" do
	title "The IAM must review changes to DBA role assignments."
	desc "Unauthorized assignment of DBA privileges can lead to a compromise of DBMS integrity. Providing oversight to the authorization and assignment of privileges provides the separation of duty to support sufficient oversight.false"
	impact 0.5
	tag "check": "Review policy and procedures documented or noted in the System Security Plan as well as evidence of implementation for monitoring changes to DBA role assignments and procedures for notifying the IAM of the changes for review.

If policy, procedures or implementation evidence do not exist, this is a Finding."
	tag "fix": "Develop, document and implement procedures to monitor changes to DBA role assignments.

Develop, document and implement procedures to notify the IAM of changes to DBA role assignments.

Include in the procedures methods that provide evidence of monitoring and notification."

	# Write Check Logic Here

end