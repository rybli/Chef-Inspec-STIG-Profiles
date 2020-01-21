# encoding: utf-8
#
control "V-72257" do
  title "The Red Hat Enterprise Linux operating system must be configured so that the SSH private host key files have mode 0640 or less permissive."
  desc  "If an unauthorized user obtains the private SSH host key file, the
host could be impersonated."
  impact 0.5
  tag "check": 'Verify the SSH private host key files have mode "0640" or less permissive.

The following command will find all SSH private key files on the system and list their modes:

# find / -name "*ssh_host*key" | xargs ls -lL

-rw-r----- 1 root ssh_keys 668 Nov 28 06:43 ssh_host_dsa_key
-rw-r----- 1 root ssh_keys 582 Nov 28 06:43 ssh_host_key
-rw-r----- 1 root ssh_keys 887 Nov 28 06:43 ssh_host_rsa_key

If any file has a mode more permissive than "0640", this is a finding.'
  tag "fix": 'Configure the mode of SSH private host key files under "/etc/ssh" to "0640" with the following command:

# chmod 0640 /path/to/file/ssh_host*key'

  key_files = command("find /etc/ssh -xdev -name '*ssh_host*key' -perm /137").stdout.split("\n")
  if !key_files.nil? and !key_files.empty?
    key_files.each do |keyfile|
      describe file(keyfile) do
        it { should_not be_executable.by('owner') }
        it { should_not be_readable.by('group') }
        it { should_not be_writable.by('group') }
        it { should_not be_executable.by('group') }
        it { should_not be_readable.by('others') }
        it { should_not be_writable.by('others') }
        it { should_not be_executable.by('others') }
      end
    end
  else
    describe "No files have a more permissive mode." do
      subject { key_files.nil? or key_files.empty? }
      it { should eq true }
    end
  end
end
