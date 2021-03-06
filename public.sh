# cd $WORK_PATH/trunk 执行在这个目录下

# 1.修改一些默认参数 ./user/shared/defaults.h（需要不同设备不同拷贝到相应sh文件就好)

# user_name="admin"                        # 用户名 admin
# user_password=$user_name                 # 用户密码 admin
# lan_ip="192.168.3"                       # lan 地址 192.168.3.1 一定别写后面的 .1
wifi_password="19960730"               # wifi密码，切记密码最少8位 admin
version_time=$(date "+%Y%m%d")           # 自动时间更新时版本号: 20200320
default_path="./user/shared/defaults.h"  # 默认文件配置目录


# echo '修改用户名'
# sed -i 's/#define\s*SYS_USER_ROOT\s*"admin"/#define  SYS_USER_ROOT     "'$user_name'"/g' $default_path

# echo '修改密码'
# sed -i 's/#define\s*DEF_ROOT_PASSWORD\s*"admin"/#define  DEF_ROOT_PASSWORD     "'$user_password'"/g' $default_path

# echo "修改Lan ip"
# sed -i "s/192.168.2/$lan_ip/g" $default_path

echo "修改Wif密码"
sed -i "s/1234567890/$wifi_password/g" $default_path

# echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=[0-9]*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc

#sed -i 's/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=n/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=y/g' .config

# 2. 删除预设项
################################################################################################
# 因不同型号配置功能不一样，所以先把配置项删除，如果你自己要添加其他的，也要写上删除这一条，切记！！！
################################################################################################
# Default
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR/d" .config            # 删除配置项 dropbear SSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE/d" .config  # 删除配置项 dropbear symmetrica
sed -i "/CONFIG_FIRMWARE_INCLUDE_OPENSSH/d" .config             # 删除配置项 OpenSSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DDNS_SSL/d"  .config           # HTTPS support for DDNS client
sed -i "/CONFIG_FIRMWARE_INCLUDE_HTTPS/d"  .config              # HTTPS support

# C大
sed -i "/CONFIG_FIRMWARE_INCLUDE_MENTOHUST/d" .config    # 删除配置项 MENTOHUST
sed -i "/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT/d" .config   # 删除配置项 SCUTCLIENT
sed -i "/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS/d" .config  # 删除配置项 SS plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_SSSERVER/d" .config     # 删除配置项 SS server
sed -i "/CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER/d" .config # 删除配置项 DNS-FORWARDER
sed -i "/CONFIG_FIRMWARE_INCLUDE_ADBYBY/d" .config       # 删除配置项 adbyby plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_TUNSAFE/d" .config      # 删除配置项 TUNSAFE
sed -i "/CONFIG_FIRMWARE_INCLUDE_ALIDDNS/d" .config      # 删除配置项 阿里 DDNS
sed -i "/CONFIG_FIRMWARE_INCLUDE_SMARTDNS/d" .config     # 删除配置项 smartDns
sed -i "/CONFIG_FIRMWARE_INCLUDE_SRELAY/d" .config       # 删除配置项 srelay 代理
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYY/d" >> .config        # 删除配置项 网易云解锁
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYYBIN/d" >> .config     # 删除配置项 网易云解锁GO版本执行文件（4M多）注意固件超大小

# 3. 添加公共自定义功能，设备单个的到设备 sh文件中添加
######################################################################
# 以下选项是定义你需要的功能（y=集成,n=忽略），重新写入到.config文件
######################################################################

# 科学
echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y" >> .config  # SS plus+
echo "CONFIG_FIRMWARE_INCLUDE_SSSERVER=n" >> .config     # SS server
echo "CONFIG_FIRMWARE_INCLUDE_TROJAN=n" >> .config
echo "CONFIG_FIRMWARE_INCLUDE_V2RAY=y" >> .config

#  代理
echo "CONFIG_FIRMWARE_INCLUDE_TUNSAFE=n" >> .config      # TUNSAFE
echo "CONFIG_FIRMWARE_INCLUDE_SRELAY=n" >> .config       # srelay
echo "CONFIG_FIRMWARE_INCLUDE_IPT2SOCKS=y" >> .config    # IPT2

# 广告
echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=n" >> .config       # adbyby plus+

# DNS 有关
echo "CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER=y" >> .config # DNS-FORWARDER
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=n" >> .config     # smartdns
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNSBIN=n" >> .config  # smartdns二进制文件
#echo "CONFIG_FIRMWARE_INCLUDE_NAPT66=n" >> .config 
# 其他

echo "CONFIG_FIRMWARE_INCLUDE_MENTOHUST=n" >> .config    # MENTOHUST 锐捷认证
echo "CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=n" >> .config   # SCUT校园网客户


#  Default

### Include OpenSSH instead of dropbear. openssl ~1.2MB, openssh ~1.0MB
echo "CONFIG_FIRMWARE_INCLUDE_OPENSSH=n" >> .config

### Include dropbear SSH. ~0.3MB
echo "CONFIG_FIRMWARE_INCLUDE_DROPBEAR=n" >> .config

### Make the dropbear symmetrical ciphers and hashes faster. ~0.06MB
echo "CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE=n" >> .config

### Include HTTPS support for DDNS client. openssl ~1.2MB
echo "CONFIG_FIRMWARE_INCLUDE_DDNS_SSL=n" >> .config

### Include HTTPS support. openssl ~1.2MB
echo "CONFIG_FIRMWARE_INCLUDE_HTTPS=y" >> .config

#网易云解锁
echo "CONFIG_FIRMWARE_INCLUDE_WYY=n" >> .config
#网易云解锁GO版本执行文件（4M多）注意固件超大小
echo "CONFIG_FIRMWARE_INCLUDE_WYYBIN=n" >> .config
