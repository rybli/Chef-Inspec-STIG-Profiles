# encoding: utf-8
# If an HBSS or HIPS is active on the system, this is Not Applicable.
control "V-71991" do
  title "The operating system must enable the SELinux targeted policy."
  desc  "
    Without verification of the security functions, security functions may not
operate correctly and the failure may go unnoticed. Security function is
defined as the hardware, software, and/or firmware of the information system
responsible for enforcing the system security policy and supporting the
isolation of code and data on which the protection is based. Security
functionality includes, but is not limited to, establishing system accounts,
configuring access authorizations (i.e., permissions, privileges), setting
events to be audited, and setting intrusion detection parameters.

    This requirement applies to operating systems performing security function
verification/testing and/or systems and environments that require this
functionality.
  "
  impact 0.7
  tag "check": "Verify the operating system verifies correct operation of all
security functions.

Check if \"SELinux\" is active and is enforcing the targeted policy with the
following command:

# sestatus

SELinux status:                 enabled

SELinuxfs mount:                /selinux

SELinux root directory:         /etc/selinux

Loaded policy name:             targeted

Current mode:                   enforcing

Mode from config file:          enforcing

Policy MLS status:              enabled

Policy deny_unknown status:     allowed

Max kernel policy version:      28


If the \"Policy from config file\" is not set to \"targeted\", or the \"Loaded
policy name\" is not set to \"targeted\", this is a finding.
"
  tag "fix": "Configure the operating system to verify correct operation of all
security functions.

Set the \"SELinuxtype\" to the \"targeted\" policy by modifying the
\"/etc/selinux/config\" file to have the following line:

SELINUXTYPE=targeted

A reboot is required for the changes to take effect."

  #@todo - SELinux resource?? (https://github.com/chef/inspec/issues/534)
  describe.one do
    describe command('sestatus') do
      its('stdout') { should match %r{^Policy\sfrom\sconfigs\sfile:\s+targeted\n?$} }
    end
    describe command('sestatus') do
      its('stdout') { should match %r{^Loaded\spolicy\sname:\s+targeted\n?$} }
    end
  end
end
