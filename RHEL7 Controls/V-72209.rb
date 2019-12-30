# encoding: utf-8
#

control "V-72209" do
  title "The system must send rsyslog output to a log aggregation server."
  desc  "Sending rsyslog output to another system ensures that the logs cannot
be removed or modified in the event that the system is compromised or has a
hardware failure."
  impact 0.5
  tag "check": "Verify \"rsyslog\" is configured to send all messages to a log
aggregation server.

Check the configuration of \"rsyslog\" with the following command:

Note: If another logging package is used, substitute the utility configuration
file for \"/etc/rsyslog.conf\".

# grep @ /etc/rsyslog.conf
*.* @@logagg.site.mil

If there are no lines in the \"/etc/rsyslog.conf\" file that contain the \"@\"
or \"@@\" symbol(s), and the lines with the correct symbol(s) to send output to
another system do not cover all \"rsyslog\" output, ask the System
Administrator to indicate how the audit logs are off-loaded to a different
system or media.

If there is no evidence that the audit logs are being sent to another system,
this is a finding."
  tag "fix": "Modify the \"/etc/rsyslog.conf\" file to contain a configuration
line to send all \"rsyslog\" output to a log aggregation system:

*.* @@<log aggregation system name>"

  describe command("grep /etc/rsyslog.conf | grep -v \"^#\"") do
    its('stdout.strip') { should_not be_empty }
  end
end
