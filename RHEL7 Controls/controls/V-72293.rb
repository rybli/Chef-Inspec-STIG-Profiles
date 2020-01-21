# encoding: utf-8
#
control "V-72293" do
  title "The system must not send Internet Protocol version 4 (IPv4) Internet
Control Message Protocol (ICMP) redirects."
  desc  "ICMP redirect messages are used by routers to inform hosts that a more
direct route exists for a particular destination. These messages contain
information from the system's route table, possibly revealing portions of the
network topology."
  impact 0.5
  tag "check": "Verify the system does not send IPv4 ICMP redirect messages.

Check the value of the \"all send_redirects\" variables with the following
command:

# grep  'net.ipv4.conf.all.send_redirects' /etc/sysctl.conf

net.ipv4.conf.all.send_redirects=0

If the returned line does not have a value of \"0\", or a line is not returned,
this is a finding."
  tag "fix": "Configure the system to not allow interfaces to perform IPv4 ICMP
redirects.

Set the system to the required kernel parameter by adding the following line to
\"/etc/sysctl.conf\" (or modify the line to have the required value):

net.ipv4.conf.all.send_redirects=0"

  describe kernel_parameter('net.ipv4.conf.all.send_redirects') do
    its('value') { should eq 0 }
  end
end
