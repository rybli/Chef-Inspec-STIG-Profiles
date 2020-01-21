# encoding: utf-8
#
control "V-94843" do
  title "The Red Hat Enterprise Linux operating system must be configured so that the x86 Ctrl-Alt-Delete key sequence is disabled in the GUI."
  desc  "A locally logged-on user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. If accidentally pressed, as could happen in the case of a mixed OS environment, this can create the risk of short-term loss of availability of systems due to unintentional reboot. In the GNOME graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence is reduced because the user will be prompted before any action is taken."
  impact 0.5
  tag "check": "Verify the operating system is not configured to reboot the system when Ctrl-Alt-Delete is pressed.

Check that the ctrl-alt-del.target is masked and not active in the GUI with the following command:

# grep logout /etc/dconf/local.d/*

logout=''

If 'logout' is not set to use two single quotations, or is missing, this is a finding."
  tag "fix": "Configure the system to disable the Ctrl-Alt-Delete sequence for the GUI with the following command:

# touch /etc/dconf/db/local.d/00-disable-CAD

Add the setting to disable the Ctrl-Alt-Delete sequence for GNOME:

[org/gnome/settings-daemon/plugins/media-keys]
logout=''"

if package('gnome-desktop3').installed?
  describe command('grep logout /etc/dconf/local.d/*') do
    its('stdout') { should eq 'logout='''}
  end
else
  describe "The system does not have GNOME installed" do
    skip "The system does not have GNOME installed, this requirement is Not
      Applicable."
  end
end
end
