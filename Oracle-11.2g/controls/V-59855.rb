# encoding: utf-8

control "V-59855" do
	title "Owners of privileged accounts must use non-privileged accounts for non-administrative activities."
	desc "Use of privileged accounts for non-administrative purposes puts data at risk of unintended or unauthorized loss, modification, or exposure. In particular, DBA accounts, if used for non-administration application development or application maintenance, can lead to excessive privileges where privileges are inherited by object owners. It may also lead to loss or compromise of application data where the elevated privileges bypass controls designed in and provided by applications.false"
	impact 0.5
	tag "check": "Review procedures and practices.  If there is not a policy requiring owners of privileged accounts to use non-privileged accounts for non-administrative activities, this is a finding.

If there is evidence that owners of privileged accounts do not adhere to this policy, this is a finding."
	tag "fix": "Require that DBAs and other privileged users use non-privileged accounts for non-administrative activities."

	# Write Check Logic Here

end