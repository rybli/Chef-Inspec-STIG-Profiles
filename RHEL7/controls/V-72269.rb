# encoding: utf-8
#
control "V-72269" do
  title "The operating system must, for networked systems, synchronize clocks
with a server that is synchronized to one of the redundant United States Naval
Observatory (USNO) time servers, a time server designated for the appropriate
DoD network (NIPRNet/SIPRNet), and/or the Global Positioning System (GPS)."
  desc  "
    Inaccurate time stamps make it more difficult to correlate events and can
lead to an inaccurate analysis. Determining the correct time a particular event
occurred on a system is critical when conducting forensic analysis and
investigating system events. Sources outside the configured acceptable
allowance (drift) may be inaccurate.

    Synchronizing internal information system clocks provides uniformity of
time stamps for information systems with multiple system clocks and systems
connected over a network.

    Organizations should consider endpoints that may not have regular access to
the authoritative time server (e.g., mobile, teleworking, and tactical
endpoints).
  "
  impact 0.5
  tag "check": "Check to see if NTP is running in continuous mode:

# ps -ef | grep ntp

If NTP is not running, check to see if 'chronyd' is running in continuous mode:

# ps -ef | grep chronyd

If NTP or 'chronyd' is not running, this is a finding.

If the NTP process is found, then check the 'ntp.conf' file for the 'maxpoll' option setting:

# grep maxpoll /etc/ntp.conf

server 0.rhel.pool.ntp.org iburst maxpoll 10

If the option is set to '17' or is not set, this is a finding.

If the file does not exist, check the ''/etc/cron.daily' subdirectory for a crontab file controlling the execution of the 'ntpd -q' command.

# grep -i 'ntpd -q' /etc/cron.daily/*
# ls -al /etc/cron.* | grep ntp

ntp

If a crontab file does not exist in the '/etc/cron.daily' that executes the 'ntpd -q' command, this is a finding.

If the 'chronyd' process is found, then check the 'chrony.conf' file for the 'maxpoll' option setting:

# grep maxpoll /etc/chrony.conf

server 0.rhel.pool.ntp.org iburst maxpoll 10

If the option is not set or the line is commented out, this is a finding."
  tag "fix": "Edit the '/etc/ntp.conf' or '/etc/chrony.conf' file and add or update an entry to define 'maxpoll' to '10' as follows:

server 0.rhel.pool.ntp.org iburst maxpoll 10

If NTP was running and 'maxpoll' was updated, the NTP service must be restarted:

# systemctl restart ntpd

If NTP was not running, it must be started:

# systemctl start ntpd

If 'chronyd' was running and 'maxpoll' was updated, the service must be restarted:

# systemctl restart chronyd.service

If 'chronyd' was not running, it must be started:

# systemctl start chronyd.service"


  describe.one do
    describe service('ntpd') do
      it { should be_running }
    end
    describe service('chronyd') do
      it { should be_running}
    end 
  end


  describe.one do
    describe command('ntpd --saveconfigquit=/dev/stdout | grep -E "^server\s"') do
      its('stdout.strip') { should_not be_empty }
      its('stdout.strip.lines') { should all(match(%r{\smaxpoll\s+([1-9]|1[0-6])\b})) }
    end
    # Case where maxpoll empty
    describe file('/etc/cron.daily/ntpdate') do
      it { should exist }
    end
    describe command('grep maxpoll /etc/chrony.conf') do
      its('stdout') { should eq 'server 0.rhel.pool.ntp.org iburst maxpoll 10' }
    end
  end
end
