# encoding: utf-8

control "V-54071" do
	title "Remote database or other external access must use fully-qualified names."
	desc "The Oracle GLOBAL_NAMES parameter is used to set the requirement for database link names to be the same name as the remote database whose connection they define. By using the same name for both, ambiguity is avoided and unauthorized or unintended connections to remote databases are less likely.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select value from v$parameter where name = 'global_names';

If the value returned is FALSE, this is a Finding."
	tag "fix": "From SQL*Plus:

alter system set global_names = TRUE scope = spfile;

NOTE: This parameter, if changed, will affect all currently defined Oracle database links.

The above SQL*Plus command will set the parameter to take effect at next system startup."

	# Write Check Logic Here

end