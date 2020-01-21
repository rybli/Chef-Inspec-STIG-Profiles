# encoding: utf-8
#
control "V-71983" do
  title "USB mass storage must be disabled."
  desc  "USB mass storage permits easy introduction of unknown devices, thereby
facilitating malicious activity."
  impact 0.5
  tag "check": "If there is an HBSS with a Device Control Module and a Data
Loss Prevention mechanism, this requirement is not applicable.

Verify the operating system disables the ability to use USB mass storage
devices.

Check to see if USB mass storage is disabled with the following command:

# grep usb-storage /etc/modprobe.d/blacklist.conf
blacklist usb-storage

If the command does not return any output or the output is not \"blacklist
usb-storage\", and use of USB storage devices is not documented with the
Information System Security Officer (ISSO) as an operational requirement, this
is a finding."
  tag "fix": "Configure the operating system to disable the ability to use USB
mass storage devices.

# vi /etc/modprobe.d/blacklist.conf

Add or update the line:

blacklist usb-storage"

  # TODO ALWAYS check your resources
  describe kernel_module('usb_storage') do
    it { should_not be_loaded }
    it { should be_blacklisted }
  end
end
