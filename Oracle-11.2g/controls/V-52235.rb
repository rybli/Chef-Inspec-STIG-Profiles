# encoding: utf-8

control "V-52235" do
	title "Unused database components that are integrated in the DBMS and cannot be uninstalled must be disabled."
	desc "Information systems are capable of providing a wide variety of functions and services. Some of the functions and services, provided by default, may not be necessary to support essential organizational operations (e.g., key missions, functions).  

It is detrimental for applications to provide, or install by default, functionality exceeding requirements or mission objectives. Examples include, but are not limited to, installing advertising software, demonstrations, or browser plug-ins not related to requirements or providing a wide array of functionality not required for the mission.

Applications must adhere to the principles of least functionality by providing only essential capabilities.

Unused, unnecessary DBMS components increase the attack surface of the DBMS by introducing additional targets for attack. By minimizing the services and applications installed on the system, the number of potential vulnerabilities is reduced. Components of the system that are unused and cannot be uninstalled must be disabled.false"
	impact 0.5
	tag "check": "Run this query to check to see what integrated components are installed in the database:

SELECT parameter, value
from v$option
where parameter in 
(
'Data Mining',
'Oracle Database Vault',
'OLAP',
'Oracle Label Security',
'Oracle Database Extensions for .NET',
'Partitioning',
'Real Application Testing'
);

This will return all of the relevant database options and their status. TRUE means that the option is installed. If the option is not installed, the option will be set to FALSE.

Review the options and check the system documentation to see what is required.  If all listed components are authorized to be in use, this is not a finding.

If any unused components or features are listed by the query as TRUE, this is a finding."
	tag "fix": "In the system documentation list the integrated components required for operation of applications that will be accessing the DBMS.

For Oracle Database 11g Release 2, only the following components can be enabled/disabled:

Oracle Data Mining (dm)
Oracle Database Vault (dv)
Oracle OLAP (olap)
Oracle Label Security (lbac)
Oracle Database Extensions for .NET (ode_net_2)
Oracle Partitioning (partitioning)
Real Application Testing (rat)

Use the chopt utility (an Oracle-supplied operating system command that resides in the <Oracle Home path>/bin directory) to disable each option that should not be available.  The command format is 

            chopt <enable|disable> <option>

where <option> is any of the abbreviatons in parentheses in the list above.  For example, to disable Real Application Testing, issue the following command at an OS prompt:

            chopt disable rat

Restart the Oracle service.

(See My Oracle Support Document 948061.1 for more on the chopt command.)"

	# Write Check Logic Here

end