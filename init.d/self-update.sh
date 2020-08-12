#!/bin/sh
rm -rf /opt/rt-n56u/trunk/user/chinadns-ng/chinadns-ng
git clone https://github.com/zfl9/chinadns-ng.git
mv chinadns-ng /opt/rt-n56u/trunk/user/chinadns-ng/chinadns-ng
sed -i "s/CC /#CC /g" /opt/rt-n56u/trunk/user/chinadns-ng/chinadns-ng/Makefile
rm -rf /opt/rt-n56u/trunk/user/dns2tcp/dns2tcp
git clone https://github.com/zfl9/dns2tcp.git
mv dns2tcp /opt/rt-n56u/trunk/user/dns2tcp/dns2tcp
sed -i "s/CC /#CC /g" /opt/rt-n56u/trunk/user/dns2tcp/dns2tcp/Makefile
#rm -rf /opt/rt-n56u/trunk/user/rc/net_wifi.c
#mv $GITHUB_WORKSPACE/rc/net_wifi.c /opt/rt-n56u/trunk/user/rc/net_wifi.c
#mv $GITHUB_WORKSPACE/rc/services.c /opt/rt-n56u/trunk/user/rc/services.c
