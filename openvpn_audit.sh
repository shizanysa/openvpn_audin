#!/bin/bash
DATE=`LC_ALL=en_US.UTF-8 date '+%a %b %e %H:%M:%S %Y'`
sender="root@example.io"
recepient="support@example.io"
cur_date="Curent date: `LC_ALL=en_US.UTF-8 date`"
cur_date_u="Curent date utc: `LC_ALL=en_US.UTF-8 date -u`"
PTR=`dig -x $untrusted_ip | egrep 'PTR|SOA' | sed 's/;//g'`
COUNTRY=`geoiplookup $untrusted_ip`
message=`echo -e "$cur_date\n$cur_date_u\n\nLogin: $common_name\n\nIP-addr: $untrusted_ip\n\n$PTR\n\n$COUNTRY\n\nClient:\nIV_VER=$IV_VER\nIV_PLAT=$IV_PLAT\nIV_PLAT_VER=$IV_PLAT_VER\nIV_PROTO=$IV_PROTO\n$IV_NCP=IV_NCP\nIV_LZ4=$IV_LZ4\nIV_LZ4v2=$IV_LZ4v2\nIV_LZO=$IV_LZO\nIV_COMP_STUB=$IV_COMP_STUB\nIV_COMP_STUBv2=$IV_COMP_STUBv2\nIV_TCPNL=$IV_TCPNL\nIV_GUI_VER=$IV_GUI_VER\nIV_SSL=$IV_SSL\n\nIP-local: $ifconfig_pool_remote_ip\n\n"`
host="`hostname`"
subject="VPN Login: $common_name from $untrusted_ip on $host, ($DATE)"
echo "$message" | mailx -r "$sender" -s "$subject" "$recepient"

