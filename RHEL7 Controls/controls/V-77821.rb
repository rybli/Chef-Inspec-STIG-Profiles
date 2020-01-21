# encoding: utf-8
#
control "V-77821" do
  title "The Red Hat Enterprise Linux operating system must be configured so that the Datagram Congestion Control Protocol (DCCP) kernel module is disabled unless required."
  desc  "Disabling DCCP protects the system against exploitation of any flaws in the protocol implementation."
  impact 0.5
  tag "check": "Verify the operating system disables the ability to load the DCCP kernel module.

# grep -r dccp /etc/modprobe.d/* | grep -i '/bin/true' | grep -v '^#'

install dccp /bin/true

If the command does not return any output, or the line is commented out, and use of DCCP is not documented with the Information System Security Officer (ISSO) as an operational requirement, this is a finding.

Verify the operating system disables the ability to use the DCCP kernel module.

Check to see if the DCCP kernel module is disabled with the following command:

# grep -i dccp /etc/modprobe.d/* | grep -i 'blacklist' | grep -v '^#'

blacklist dccp

If the command does not return any output or the output is not 'blacklist dccp', and use of the dccp kernel module is not documented with the Information System Security Officer (ISSO) as an operational requirement, this is a finding."
  tag "fix": "Configure the operating system to disable the ability to use the DCCP kernel module.

Create a file under '/etc/modprobe.d' with the following command:

# touch /etc/modprobe.d/dccp.conf

Add the following line to the created file:

install dccp /bin/true

Ensure that the DCCP module is blacklisted:

# vi /etc/modprobe.d/blacklist.conf

Add or update the line:

blacklist dccp"

  describe kernel_module('dccp') do
    it { should_not be_loaded }
    it { should be_blacklisted }
  end
end
