# encoding: utf-8
#
control "V-72063" do
  title "The system must use a separate file system for the system audit data
path."
  desc  "The use of separate file systems for different paths can protect the
system from failures resulting from a file system becoming full or failing."
  impact 0.3
  tag "check": "Determine if the \"/var/log/audit\" path is a separate file
system.

# grep /var/log/audit /etc/fstab

If no result is returned, \"/var/log/audit\" is not on a separate file system,
and this is a finding."
  tag "fix": "Migrate the system audit data path onto a separate file system."

  describe mount('/var/log/audit') do
    it {should be_mounted}
  end

end
