# encoding: utf-8

control "V-52227" do
	title "The DBMS must support organizational requirements to employ automated patch management tools to facilitate flaw remediation to organization-defined information system components."
	desc "The organization (including any contractor to the organization) shall promptly install security-relevant software updates (e.g., patches, service packs, and hot fixes). Flaws discovered during security assessments, continuous monitoring, incident response activities, or information system error handling, shall also be addressed expeditiously. Due to information system integrity and availability concerns, organizations shall give careful consideration to the methodology used to carry out automatic updates.

Automated patch management can be useful in ensuring that appropriate patches are scheduled and applied to databases as required. DBAs often support multiple databases in different environments and with different classification levels. This can lead to confusion if patch management is not automated, leading to inconsistent patching.false"
	impact 0.5
	tag "check": "Use the Oracle-provided OPATCH command to check current patch levels on the database. As the Oracle user, issue the following commands:

Unix/Linux:
 $ cd $ORACLE_HOME
 $ opatch lsinventory -d

Windows:
 > cd <ORACLE_HOME>\opatch
> opatch lsinventory -detail
 
This will generate the patch levels for the home and any specific patches that have been applied to it."
	tag "fix": "When the Quarterly CPU is released, check the CPU Notice and note the specific patch number for your system. Follow the process below to apply the security patch.

Login to My Oracle Support.  Select patches and download your specific patch number and corresponding MD5 checksum.  Once the patch is downloaded to the server, check the MD5 checksum to make sure the patch is valid. To check the MD5 Checksum in Linux/Unix, the command is: 
$md5sum absolute_path_of_file_name - file_name is the complete location of the downloaded file.
$md5sum /home/oracle/test.zip
a34d8cd98f00cf24e9800998ecf823e4 /home/oracle/test.zip

Once the checksum is validated, apply the patch.:
$ cd $ORACLE_HOME
$ opatch apply

Check that the patch was applied and the inventory was updated with the following command (Unix/Linux):
$ opatch lsinventory -d
Windows:
> opatch lsinventory -detail"

	# Write Check Logic Here

end