# encoding: utf-8
#
control "V-92251" do
  title "The Red Hat Enterprise Linux operating system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces."
  desc  "Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks."
  impact 0.5
  tag "check": "Verify the system uses a reverse-path filter for IPv4:

# grep net.ipv4.conf.all.rp_filter /etc/sysctl.conf /etc/sysctl.d/*
net.ipv4.conf.all.rp_filter = 1

If \"net.ipv4.conf.all.rp_filter\" is not configured in the /etc/sysctl.conf file or in the /etc/sysctl.d/ directory, is commented out, or does not have a value of '1', this is a finding.

Check that the operating system implements the accept source route variable with the following command:

# /sbin/sysctl -a | grep net.ipv4.conf.all.rp_filter
net.ipv4.conf.all.rp_filter = 1

If the returned line does not have a value of '1', this is a finding.
"
  tag "fix": "Set the system to the required kernel parameter by adding the following line to \"/etc/sysctl.conf\" or a configuration file in the /etc/sysctl.d/ directory (or modify the line to have the required value):

net.ipv4.conf.all.rp_filter = 1

Issue the following command to make the changes take effect:

# sysctl --system"

   describe kernel_parameter('net.ipv4.conf.all.rp_filter') do
     its('value') { should eq 1 }
   end
end
