# encoding: utf-8

control "V-54003" do
	title "Sensitive information from production database exports must be modified before being imported into a development database."
	desc "Data export from production databases may include sensitive data. Application developers do not have a need to know to sensitive data. Any access they may have to production data would be considered unauthorized access and subject the sensitive data to unlawful or unauthorized disclosure. See DODD 8500.1 for a definition of Sensitive Information.false"
	impact 0.5
	tag "check": "If the database being reviewed is a production database, this check is Not a Finding.

Review policy, procedures and restrictions for data imports of production data containing sensitive information into development databases.

If data imports of production data are allowed, review procedures for protecting any sensitive data included in production exports.

If sensitive data is included in the exports and no procedures are in place to remove or modify the data to render it not sensitive prior to import into a development database or policy and procedures are not in place to ensure authorization of development personnel to access sensitive information contained in production data, this is a Finding."
	tag "fix": "Develop, document and implement policy, procedures and restrictions for production data import.

Require any users assigned privileges that allow the export of production data from the database to acknowledge understanding of import policies, procedures and restrictions.

Restrict permissions of development personnel requiring use or access to production data imported into development databases containing sensitive information to authorized users.

Implement policy and procedures to modify or remove sensitive information in production exports prior to import into development databases."

	# Write Check Logic Here

end