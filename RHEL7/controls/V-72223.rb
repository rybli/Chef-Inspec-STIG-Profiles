# encoding: utf-8
#

control "V-72223" do
  title "All network connections associated with a communication session must
be terminated at the end of the session or after 10 minutes of inactivity from
the user at a command prompt, except to fulfill documented and validated
mission requirements."
  desc  "
    Terminating an idle session within a short time period reduces the window
of opportunity for unauthorized personnel to take control of a management
session enabled on the console or console port that has been left unattended.
In addition, quickly terminating an idle session will also free up resources
committed by the managed network element.

    Terminating network connections associated with communications sessions
includes, for example, de-allocating associated TCP/IP address/port pairs at
the operating system level and de-allocating networking assignments at the
application level if multiple application sessions are using a single operating
system-level network connection. This does not mean that the operating system
terminates all sessions or network access; it only ends the inactive session
and releases the resources associated with that session.
  "
  impact 0.5
  tag "check": "Verify the operating system terminates all network connections
associated with a communications session at the end of the session or based on
inactivity.

Check the value of the system inactivity timeout with the following command:

# grep -i tmout /etc/bashrc /etc/profile.d/*

TMOUT=600

If \"TMOUT\" is not set to \"600\" or less in \"/etc/bashrc\" or in a script
created to enforce session termination after inactivity, this is a finding."
  tag "fix": "Configure the operating system to terminate all network
connections associated with a communications session at the end of the session
or after a period of inactivity.

Add or update the following lines in \"/etc/profile\".

TMOUT=600
readonly TMOUT
export TMOUT

Or create a script to enforce the inactivity timeout (for example
/etc/profile.d/tmout.sh) such as:

#!/bin/bash

TMOUT=600
readonly TMOUT
export TMOUT"

  bashrc_file = parse_config_file('/etc/bashrc')

  describe.one do
    describe bashrc_file do
      its('TMOUT') { should cmp <= 600 }
    end

    profiled_files = command("find /etc/profile.d/*").stdout.split("\n")
    profiled_files.each do |file|
      profile_file = parse_config_file(file)
      describe profile_file do
        its('TMOUT') { should cmp <= 600 }
      end
    end
  end
end