#!/bin/bash

# 备份现有的 sources.list 文件
echo "正在备份当前的 sources.list 到 sources.list.old"
mv /etc/apt/sources.list /etc/apt/sources.list.old

# 选择新的镜像源
echo "请选择要替换的镜像源："
echo "1) 默认官方源"
echo "2) 腾讯云内网源"
echo "3) 阿里云内网源"
echo "4) Linode源"
read -p "请输入编号（1-4）: " choice

case $choice in
    1)
        # 默认官方源
        cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian/ buster main contrib non-free
deb-src http://deb.debian.org/debian/ buster main contrib non-free

deb http://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free

deb http://deb.debian.org/debian/ buster-backports main contrib non-free
deb-src http://deb.debian.org/debian/ buster-backports main contrib non-free

deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free
EOF
        ;;
    2)
        # 腾讯云内网源
        cat > /etc/apt/sources.list << EOF
deb http://mirrors.tencentyun.com/debian/ buster main contrib non-free
deb-src http://mirrors.tencentyun.com/debian/ buster main contrib non-free

deb http://mirrors.tencentyun.com/debian/ buster-updates main contrib non-free
deb-src http://mirrors.tencentyun.com/debian/ buster-updates main contrib non-free

deb http://mirrors.tencentyun.com/debian/ buster-backports main contrib non-free
deb-src http://mirrors.tencentyun.com/debian/ buster-backports main contrib non-free

deb http://mirrors.tencentyun.com/debian-security/ buster/updates main contrib non-free
deb-src http://mirrors.tencentyun.com/debian-security/ buster/updates main contrib non-free
EOF
        ;;
    3)
        # 阿里云内网源
        cat > /etc/apt/sources.list << EOF
deb http://mirrors.cloud.aliyuncs.com/debian/ buster main contrib non-free
deb-src http://mirrors.cloud.aliyuncs.com/debian/ buster main contrib non-free

deb http://mirrors.cloud.aliyuncs.com/debian/ buster-updates main contrib non-free
deb-src http://mirrors.cloud.aliyuncs.com/debian/ buster-updates main contrib non-free

deb http://mirrors.cloud.aliyuncs.com/debian/ buster-backports main contrib non-free
deb-src http://mirrors.cloud.aliyuncs.com/debian/ buster-backports main contrib non-free

deb http://mirrors.cloud.aliyuncs.com/debian-security/ buster/updates main contrib non-free
deb-src http://mirrors.cloud.aliyuncs.com/debian-security/ buster/updates main contrib non-free
EOF
        ;;
    4)
        # Linode源
        cat > /etc/apt/sources.list << EOF
deb http://mirrors.linode.com/debian/ buster main contrib non-free
deb-src http://mirrors.linode.com/debian/ buster main contrib non-free

deb http://mirrors.linode.com/debian/ buster-updates main contrib non-free
deb-src http://mirrors.linode.com/debian/ buster-updates main contrib non-free

deb http://mirrors.linode.com/debian/ buster-backports main contrib non-free
deb-src http://mirrors.linode.com/debian/ buster-backports main contrib non-free

deb http://mirrors.linode.com/debian-security/ buster/updates main contrib non-free
deb-src http://mirrors.linode.com/debian-security/ buster/updates main contrib non-free
EOF
        ;;
    *)
        echo "无效的选择，请重新运行脚本并输入正确的数字。"
        exit 1
        ;;
esac

# 更新 apt 软件包索引
echo "正在更新 apt 软件包索引..."
apt update

echo "源替换完成！"
