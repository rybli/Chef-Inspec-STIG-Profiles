# encoding: utf-8
#

# TODO this needs to be reworked to allow `X11_NEEDED` attribute

x11_enabled = attribute(
  'x11_enabled',
  description: 'Set to `true` if a GUI or X11 is needed on the system',
  value: false
)

control "V-72307" do
  title "An X Windows display manager must not be installed unless approved."
  desc  "Internet services that are not required for system or application
processes must not be active to decrease the attack surface of the system. X
Windows has a long history of security vulnerabilities and will not be used
unless approved and documented."
  impact 0.5
  tag "check": "Verify that if the system has X Windows System installed, it is
authorized.

Check for the X11 package with the following command:

# rpm -qa | grep xorg | grep server

Ask the System Administrator if use of the X Windows System is an operational
requirement.

If the use of X Windows on the system is not documented with the Information
System Security Officer (ISSO), this is a finding."
  tag "fix": "Document the requirement for an X Windows server with the ISSO or
remove the related packages with the following commands:

# rpm -e xorg-x11-server-common"

  describe package('xorg-x11-server-common') do
    it { should_not be_installed }
  end if !x11_enabled

  describe package('xorg-x11-server-common') do
    it { should be_installed }
  end if x11_enabled
end
