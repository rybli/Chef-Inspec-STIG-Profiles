# encoding: utf-8
#

multifactor_enabled = attribute(
  'multifactor_enabled',
  value: 'true',
  description: "Should dconf have smart card authentication"
)

dconf_user = attribute(
  'dconf_user',
  value: '',
  description: "User to use to check dconf settings"
)

control "V-77819" do
  title "The operating system must uniquely identify and must authenticate
users using multifactor authentication via a graphical user logon."
  desc  "
    To assure accountability and prevent unauthenticated access, users must be
identified and authenticated to prevent potential misuse and compromise of the
system.

    Multifactor solutions that require devices separate from information
systems gaining access include, for example, hardware tokens providing
time-based or challenge-response authenticators and smart cards such as the
U.S. Government Personal Identity Verification card and the DoD Common Access
Card.
  "
  if package('gnome-desktop3').installed? and (package('pcsc-lite').installed? or package('esc').installed?)
    impact 0.5
  else
    impact 0.0
  end
  tag "check": "Verify the operating system uniquely identifies and
authenticates users using multifactor authentication via a graphical user logon.

Note: If the system does not have GNOME installed, this requirement is Not
Applicable.

Determine which profile the system database is using with the following command:

# grep system-db /etc/dconf/profile/user

system-db:local

Note: The example is using the database local for the system, so the path is
\"/etc/dconf/db/local.d\". This path must be modified if a database other than
local is being used.

# grep enable-smartcard-authentication /etc/dconf/db/local.d/*

enable-smartcard-authentication=true

If \"enable-smartcard-authentication\" is set to \"false\" or the keyword is
missing, this is a finding."
  tag "fix": "Configure the operating system to uniquely identify and
authenticate users using multifactor authentication via a graphical user logon.

Note: If the system does not have GNOME installed, this requirement is Not
Applicable.

Create a database to contain the system-wide screensaver settings (if it does
not already exist) with the following command:

Note: The example is using the database local for the system, so if the system
is using another database in \"/etc/dconf/profile/user\", the file should be
created under the appropriate subdirectory.

# touch /etc/dconf/db/local.d/00-defaults

Add the setting to enable smartcard login:
enable-smartcard-authentication=true"

  # @todo - dynamically gather system_db_path?
  if package('gnome-desktop3').installed? and (package('pcsc-lite').installed? or package('esc').installed?)
    if !dconf_user.empty? and command('whoami').stdout.strip == 'root'
      describe command("sudo -u #{dconf_user} dconf read /org/gnome/login-screen/enable-smartcard-authentication") do
        its('stdout.strip') { should eq multifactor_enabled.to_s }
      end
    else
      describe command("dconf read /org/gnome/login-screen/enable-smartcard-authentication") do
        its('stdout.strip') { should eq multifactor_enabled.to_s }
      end
    end
  else
    describe "The GNOME desktop is not installed" do
      skip "The GNOME desktop is not installed, this control is Not Applicable."
    end
  end
end
