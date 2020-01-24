# encoding: utf-8
#
control "V-72295" do
  title "Network interfaces must not be in promiscuous mode."
  desc  "
    Network interfaces in promiscuous mode allow for the capture of all network
traffic visible to the system. If unauthorized individuals can access these
applications, it may allow then to collect information such as logon IDs,
passwords, and key exchanges between systems.

    If the system is being used to perform a network troubleshooting function,
the use of these tools must be documented with the Information System Security
Officer (ISSO) and restricted to only authorized personnel.
  "
  impact 0.5
  tag "check": "Verify network interfaces are not in promiscuous mode unless
approved by the ISSO and documented.

Check for the status with the following command:

# ip link | grep -i promisc

If network interfaces are found on the system in promiscuous mode and their use
has not been approved by the ISSO and documented, this is a finding."
  tag "fix": "Configure network interfaces to turn off promiscuous mode unless
approved by the ISSO and documented.

Set the promiscuous mode of an interface to off with the following command:

#ip link set dev <devicename> multicast off promisc off"

  # @todo - test against list of approved interfaces
  describe command("ip link | grep -i promisc") do
    its('stdout.strip') { should match %r{^$} }
  end
end
