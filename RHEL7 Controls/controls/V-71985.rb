# encoding: utf-8
#
control "V-71985" do
  title "File system automounter must be disabled unless required."
  desc  "Automatically mounting file systems permits easy introduction of
unknown devices, thereby facilitating malicious activity."
  impact 0.5
  tag "check": "Verify the operating system disables the ability to automount
devices.

Check to see if automounter service is active with the following command:

# systemctl status autofs
autofs.service - Automounts filesystems on demand
   Loaded: loaded (/usr/lib/systemd/system/autofs.service; disabled)
   Active: inactive (dead)

If the \"autofs\" status is set to \"active\" and is not documented with the
Information System Security Officer (ISSO) as an operational requirement, this
is a finding."
  tag "fix": "Configure the operating system to disable the ability to
automount devices.

Turn off the automount service with the following command:

# systemctl disable autofs

If \"autofs\" is required for Network File System (NFS), it must be documented
with the ISSO."

  describe systemd_service('autofs.service') do
    it { should_not be_running }
    it { should_not be_enabled }
    it { should_not be_installed }
  end
end
