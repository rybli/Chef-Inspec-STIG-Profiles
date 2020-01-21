# encoding: utf-8
#
control 'V-81011' do
  title 'The Red Hat Enterprise Linux operating system must mount /dev/shm with the nosuid option.'
  desc  'The "nosuid" mount option causes the system to not execute "setuid" and "setgid" files with owner privileges. This option must be used for mounting any file system not containing approved "setuid" and "setguid" files. Executing files from untrusted file systems increases the opportunity for unprivileged users to attain unauthorized administrative access.'
  impact 0.5
  tag 'check': 'Verify that the "nosuid" option is configured for /dev/shm:

# cat /etc/fstab | grep /dev/shm

tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0

If any results are returned and the "nosuid" option is not listed, this is a finding.

Verify "/dev/shm" is mounted with the "nosuid" option:

# mount | grep "/dev/shm" | grep nosuid

If no results are returned, this is a finding.'
  tag 'fix': 'Configure the system so that /dev/shm is mounted with the "nosuid" option.'

   describe etc_fstab.where { device_name  == '/dev/shm' } do
     its('mount_options') { should eq ['nosuid'] }
   end
end
