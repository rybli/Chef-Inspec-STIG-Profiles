# encoding: utf-8
#
control "V-72065" do
  title "The system must use a separate file system for /tmp (or equivalent)."
  desc  "The use of separate file systems for different paths can protect the
system from failures resulting from a file system becoming full or failing."
  impact 0.3
  tag "check": "Verify that a separate file system/partition has been created
for \"/tmp\".

Check that a file system/partition has been created for \"/tmp\" with the
following command:

# systemctl is-enabled tmp.mount
enabled

If the \"tmp.mount\" service is not enabled, this is a finding."
  tag "fix": "Start the \"tmp.mount\" service with the following command:

# systemctl enable tmp.mount"

  describe systemd_service('tmp.mount') do
    it { should be_enabled }
  end
end
