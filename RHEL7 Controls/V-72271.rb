## encoding: utf-8
## THIS CHECK HAS BEEN REMOVED FROM THE STIG AS OF JULY 2019
##control "V-72271" do
##  title "The operating system must protect against or limit the effects of
##Denial of Service (DoS) attacks by validating the operating system is
##implementing rate-limiting measures on impacted network interfaces."
##  desc  "
##    DoS is a condition when a resource is not available for legitimate users.
##When this occurs, the organization either cannot accomplish its mission or must
#operate at degraded capacity.
#
#    This requirement addresses the configuration of the operating system to
#mitigate the impact of DoS attacks that have occurred or are ongoing on system
#availability. For each system, known and potential DoS attacks must be
#identified and solutions for each type implemented. A variety of technologies
#exist to limit or, in some cases, eliminate the effects of DoS attacks (e.g.,
#limiting processes or establishing memory partitions). Employing increased
#capacity and bandwidth, combined with service redundancy, may reduce the
#susceptibility to some DoS attacks.
#  "
#  impact 0.5
#  tag "check": "Verify the operating system protects against or limits the
#effects of DoS attacks by ensuring the operating system is implementing
#rate-limiting measures on impacted network interfaces.
#
#Check the firewall configuration with the following command:
#
#Note: The command is to query rules for the public zone.
#
## firewall-cmd --direct --get-rule ipv4 filter IN_public_allow
#rule ipv4 filter IN_public_allow 0 -p tcp -m limit --limit 25/minute --limit-burst 100  -j ACCEPT
#
#If a rule with both the limit and limit-burst arguments parameters does not
#exist, this is a finding."
#  tag "fix": "Create a direct firewall rule to protect against DoS attacks with
#the following command:
#
#Note: The command is to add a rule to the public zone.
#
## firewall-cmd --direct --permanent --add-rule ipv4 filter IN_public_allow 0 -m tcp -p tcp -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
#
#The firewalld service will need to be restarted for this to take effect:
#
## systemctl restart firewalld"
#
#  # @todo - firewall resource?
#  describe.one do
#    describe command('firewall-cmd --direct --get-rule ipv4 filter IN_public_allow') do
#       its('stdout') { should match %r{--limit .+} }
#       its('stdout') { should match %r{--limit-burst .+} }
#    end
#    describe command('iptables -L') do
#       its('stdout') { should match %r{limit.+} }
#       its('stdout') { should match %r{burst.+} }
#    end
#  end
#end
#
