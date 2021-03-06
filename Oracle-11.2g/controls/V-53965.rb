# encoding: utf-8

control "V-53965" do
	title "Fixed user and public database links must be authorized for use."
	desc "Database links define connections that may be used by the local database to access remote Oracle databases. These links provide a means for a compromise to the local database to spread to remote databases in the distributed database environment. Limiting or eliminating use of database links where they are not required to support the operational system can help isolate compromises to the local or a limited number of databases.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select owner||': '||db_link from dba_db_links;
select count(*) from sys.dba_repcatlog;

If no records are returned from the first SQL statement, this check is Not a Finding.

If the value of the count returned is 0 for the second SQL statement, none of the database links listed above, if any, is used for replication.

Confirm the public and fixed user database links listed are documented in the System Security Plan, are authorized by the IAO and are used for replication or operational system requirements.

If any are not, this is a Finding."
	tag "fix": "Document all authorized connections from the database to remote databases in the System Security Plan.

Remove all unauthorized remote database connection definitions from the database.

From SQL*Plus:

drop database link [link name];
OR
drop public database link [link name];

Review remote database connection definitions periodically and confirm their use is still required and authorized."

	# Write Check Logic Here

end