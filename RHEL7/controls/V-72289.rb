# encoding: utf-8
#
control "V-72289" do
  title "The system must prevent Internet Protocol version 4 (IPv4) Internet
Control Message Protocol (ICMP) redirect messages from being accepted."
  desc  "ICMP redirect messages are used by routers to inform hosts that a more
direct route exists for a particular destination. These messages modify the
host's route table and are unauthenticated. An illicit ICMP redirect message
could result in a man-in-the-middle attack."
  impact 0.5
  tag "check": "Verify the system will not accept IPv4 ICMP redirect messages.

Check the value of the default \"accept_redirects\" variables with the
following command:

# /sbin/sysctl -a | grep  'net.ipv4.conf.default.accept_redirects'
net.ipv4.conf.default.accept_redirects=0

If the returned line does not have a value of \"0\", or a line is not returned,
this is a finding."
  tag "fix": "Set the system to not accept IPv4 ICMP redirect messages by
adding the following line to \"/etc/sysctl.conf\" (or modify the line to have
the required value):

net.ipv4.conf.default.accept_redirects = 0"

  describe kernel_parameter('net.ipv4.conf.default.accept_redirects') do
    its('value') { should eq 0 }
  end
end
