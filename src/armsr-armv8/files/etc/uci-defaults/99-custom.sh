
#!/bin/sh
# 固件首次启动时运行的配置脚本
LOGFILE="/tmp/uci-defaults-log.txt"
echo "Starting 99-custom.sh at $(date)" >> $LOGFILE

# 防火墙规则（允许LAN区访问）
uci set firewall.@zone[1].input='ACCEPT'

# 系统配置
uci set system.@system[0].hostname='iStoreOS'
uci commit system

# 安卓NTP域名映射
uci add dhcp domain
uci set "dhcp.@domain[-1].name=time.android.com"
uci set "dhcp.@domain[-1].ip=203.107.6.88"

# 服务访问控制
uci delete ttyd.@ttyd[0].interface  # 允许所有接口访问网页终端
uci set dropbear.@dropbear[0].Interface=''  # 允许所有接口SSH连接

# 网络配置
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.1.100'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='192.168.1.1'
uci commit network

# 编译信息修改
FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="Compiled by PlanetEditorX"
sed -i "s/DISTRIB_DESCRIPTION='[^']*'/DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'/" "$FILE_PATH"

exit 0
