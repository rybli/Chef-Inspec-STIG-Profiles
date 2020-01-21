# encoding: utf-8
#
control "V-72089" do
  title "The Red Hat Enterprise Linux operating system must initiate an action to notify the System Administrator (SA) and Information System Security Officer ISSO, at a minimum, when allocated audit record storage volume reaches 75% of the repository maximum audit record storage capacity."
  desc  "If security personnel are not notified immediately when storage volume reaches 75 percent utilization, they are unable to plan for audit record storage capacity expansion."
  impact 0.5
  tag "check": "Verify the operating system initiates an action to notify the SA and ISSO (at a minimum) when allocated audit record storage volume reaches 75 percent of the repository maximum audit record storage capacity.

Check the system configuration to determine the partition the audit records are being written to with the following command:

# grep -iw log_file /etc/audit/auditd.conf
log_file = /var/log/audit/audit.log

Check the size of the partition that audit records are written to (with the example being '/var/log/audit/'):

# df -h /var/log/audit/
0.9G /var/log/audit

If the audit records are not being written to a partition specifically created for audit records (in this example '/var/log/audit' is a separate partition), determine the amount of space other files in the partition are currently occupying with the following command:

# du -sh <partition>
1.8G /var

Determine what the threshold is for the system to take action when 75 percent of the repository maximum audit record storage capacity is reached:

# grep -iw space_left /etc/audit/auditd.conf
space_left = 225

If the value of the 'space_left' keyword is not set to 25 percent of the total partition size, this is a finding."
  tag "fix": "Configure the operating system to initiate an action to notify the SA and ISSO (at a minimum) when allocated audit record storage volume reaches 75 percent of the repository maximum audit record storage capacity.

Check the system configuration to determine the partition the audit records are being written to:

# grep -iw log_file /etc/audit/auditd.conf

Determine the size of the partition that audit records are written to (with the example being '/var/log/audit/'):

# df -h /var/log/audit/

Set the value of the 'space_left' keyword in '/etc/audit/auditd.conf' to 25 percent of the partition size."

  describe auditd_conf do
    before(:all) do
      @audit_log_dir = File.dirname(auditd_conf.log_file)

      if file(@audit_log_dir).directory?
        partition_info = command("df -h #{@audit_log_dir}").stdout.split("\n")

        partition_sz_arr = partition_info.last.gsub(/\s+/m, ' ').strip.split(" ")

        # Get partition size in GB
        partition_sz = partition_sz_arr[1].gsub(/G/, '')

        # Convert to MB and get 25%
        @exp_space_left = partition_sz.to_i * 1024 / 4
      end
    end

    it 'should have an audit log directory' do
      expect(file(@audit_log_dir).directory?).to be true
    end

    its('space_left.to_i') { should be >= @exp_space_left }
  end
end
