# encoding: utf-8
#

control "V-71941" do
  title "The operating system must disable account identifiers (individuals,
groups, roles, and devices) if the password expires."
  desc  "
    Inactive identifiers pose a risk to systems and applications because
attackers may exploit an inactive identifier and potentially obtain undetected
access to the system. Owners of inactive accounts will not notice if
unauthorized access to their user account has been obtained.

    Operating systems need to track periods of inactivity and disable
application identifiers after zero days of inactivity.
  "
  impact 0.5
  tag "check": "Verify the operating system disables account identifiers
(individuals, groups, roles, and devices) after the password expires with the
following command:

# grep -i inactive /etc/default/useradd
INACTIVE=0

If the value is not set to \"0\", is commented out, or is not defined, this is
a finding."
  tag "fix": "Configure the operating system to disable account identifiers
(individuals, groups, roles, and devices) after the password expires.

Add the following line to \"/etc/default/useradd\" (or modify the line to have
the required value):

INACTIVE=0"
  describe parse_config_file("/etc/default/useradd") do
    its('INACTIVE') { should cmp <= 0 }
  end
end
