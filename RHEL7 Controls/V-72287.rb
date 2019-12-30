# encoding: utf-8
#
control "V-72287" do
  title "The system must not respond to Internet Protocol version 4 (IPv4)
Internet Control Message Protocol (ICMP) echoes sent to a broadcast address."
  desc  "Responding to broadcast (ICMP) echoes facilitates network mapping and
provides a vector for amplification attacks."
  impact 0.5
  tag "check": "Verify the system does not respond to IPv4 ICMP echoes sent to
a broadcast address.

Check the value of the \"icmp_echo_ignore_broadcasts\" variable with the
following command:

# /sbin/sysctl -a | grep  net.ipv4.icmp_echo_ignore_broadcasts
net.ipv4.icmp_echo_ignore_broadcasts=1

If the returned line does not have a value of \"1\", a line is not returned, or
the retuned line is commented out, this is a finding."
  tag "fix": "Set the system to the required kernel parameter by adding the
following line to \"/etc/sysctl.conf\" (or modify the line to have the required
value):

net.ipv4.icmp_echo_ignore_broadcasts=1"

  describe kernel_parameter('net.ipv4.icmp_echo_ignore_broadcasts') do
    its('value') { should eq 1 }
  end
end
