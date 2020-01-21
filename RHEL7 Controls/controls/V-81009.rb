# encoding: utf-8
#
control 'V-81009' do
  title 'The Red Hat Enterprise Linux operating system must mount /dev/shm with the nodev option.'
  desc  'The "nodev" mount option causes the system to not interpret character or block special devices. Executing character or block special devices from untrusted file systems increases the opportunity for unprivileged users to attain unauthorized administrative access.'
  impact 0.5
  tag 'check': 'Verify that the "nodev" option is configured for /dev/shm:


# cat /etc/fstab | grep /dev/shm
tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0

If any results are returned and the "nodev" option is not listed, this is a finding.

Verify "/dev/shm" is mounted with the "nodev" option:

# mount | grep "/dev/shm" | grep nodev

If no results are returned, this is a finding.
'
  tag 'fix': 'Configure the system so that /dev/shm is mounted with the "nodev" option.
'

   describe etc_fstab.where { device_name  == '/dev/shm' } do
     its('mount_options') { should eq  ['nodev'] }
   end
end
