# encoding: utf-8
#
control "V-77825" do
  title "The operating system must implement virtual address space
randomization."
  desc  "Address space layout randomization (ASLR) makes it more difficult for
an attacker to predict the location of attack code he or she has introduced
into a process's address space during an attempt at exploitation. Additionally,
ASLR also makes it more difficult for an attacker to know the location of
existing code in order to repurpose it using return-oriented programming (ROP)
techniques."
  impact 0.5
  tag "check": "Verify the operating system implements virtual address space
randomization.

Check that the operating system implements virtual address space randomization
with the following command:

# grep kernel.randomize_va_space /etc/sysctl.conf

kernel.randomize_va_space=2

If \"kernel.randomize_va_space\" does not have a value of \"2\", this is a
finding."
  tag "fix": "Configure the operating system implement virtual address space
randomization.

Set the system to the required kernel parameter by adding the following line to
\"/etc/sysctl.conf\" (or modify the line to have the required value):

kernel.randomize_va_space=2"

  describe kernel_parameter('kernel.randomize_va_space') do
    its('value') { should eq 2 }
  end

end
