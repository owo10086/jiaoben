#!/bin/bash
#de10-12+ub22

# 备份现有的 sources.list 文件
echo "正在备份当前的 sources.list 到 sources.list.old"
mv /etc/apt/sources.list /etc/apt/sources.list.old

# 检查系统版本
source /etc/os-release
SYSTEM=$ID
VERSION=$VERSION_ID

# 根据系统和版本号选择镜像源
echo "检测到的系统: $SYSTEM $VERSION"

if [[ "$SYSTEM" == "debian" && "$VERSION" == "10" ]]; then
    echo "您正在使用 Debian 10 (Buster)"
    echo "请选择要替换的镜像源："
    echo "1) 官方源"
    echo "2) 清华源"
    echo "3) 中科大源"
    echo "4) 腾讯源"
    echo "5) 阿里源"
    echo "6) 华为源"
    read -p "请输入编号: " choice
    case $choice in
        1) cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian/ buster main contrib non-free
deb-src http://deb.debian.org/debian/ buster main contrib non-free

deb http://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free

deb http://deb.debian.org/debian/ buster-backports main contrib non-free
deb-src http://deb.debian.org/debian/ buster-backports main contrib non-free

deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free
EOF ;;
        2) cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ buster/updates main contrib non-free
EOF ;;
        3) cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free
EOF ;;
        4) cat > /etc/apt/sources.list << EOF
deb http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib
deb http://mirrors.cloud.tencent.com/debian-security buster/updates main
deb http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib
deb http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib

deb-src http://mirrors.cloud.tencent.com/debian-security buster/updates main
deb-src http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib
deb-src http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib
EOF ;;
        5) cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib

deb-src http://mirrors.aliyun.com/debian-security buster/updates main
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
EOF ;;
        6) cat > /etc/apt/sources.list << EOF
deb https://mirrors.huaweicloud.com/debian/ buster main contrib non-free
deb https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free
deb https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free
deb https://mirrors.huaweicloud.com/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.huaweicloud.com/debian/ buster main contrib non-free
deb-src https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free
deb-src https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free 
EOF ;;
        *) 
            echo "无效的选择，请重新运行脚本并选择有效的编号。"
            ;;
    esac

elif [[ "$SYSTEM" == "debian" && "$VERSION" == "11" ]]; then
    echo "您正在使用 Debian 11 (Bullseye)"
    echo "请选择要替换的镜像源："
    echo "1) 官方源"
    echo "2) 清华源"
    echo "3) 中科大源"
    echo "4) 腾讯源"
    echo "5) 阿里源"
    echo "6) Linode源"
    read -p "请输入编号: " choice
    case $choice in
        1) cat > /etc/apt/sources.list << EOF
deb https://deb.debian.org/debian/ bullseye main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye main contrib non-free

deb https://deb.debian.org/debian/ bullseye-updates main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye-updates main contrib non-free

deb https://deb.debian.org/debian/ bullseye-backports main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye-backports main contrib non-free

deb https://deb.debian.org/debian-security/ bullseye-security main contrib non-free
deb-src https://deb.debian.org/debian-security/ bullseye-security main contrib non-free
EOF ;;
        2) cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bullseye-security main contrib non-free
EOF ;;
        3) cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
EOF ;;
        4) cat > /etc/apt/sources.list << EOF
deb https://mirrors.cloud.tencent.com/debian/ bullseye main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye main contrib non-free

deb https://mirrors.cloud.tencent.com/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye-updates main contrib non-free

deb https://mirrors.cloud.tencent.com/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye-backports main contrib non-free

deb https://mirrors.cloud.tencent.com/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian-security/ bullseye-security main contrib non-free
EOF ;;
        5) cat > /etc/apt/sources.list << EOF
deb https://mirrors.aliyun.com/debian/ bullseye main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye main contrib non-free

deb https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free

deb https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free

deb https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free
EOF ;;
        6) cat > /etc/apt/sources.list << EOF
deb http://mirrors.linode.com/debian/ bullseye main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye main contrib non-free

deb http://mirrors.linode.com/debian/ bullseye-updates main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye-updates main contrib non-free

deb http://mirrors.linode.com/debian/ bullseye-backports main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye-backports main contrib non-free

deb http://mirrors.linode.com/debian-security/ bullseye-security main contrib non-free
deb-src http://mirrors.linode.com/debian-security/ bullseye-security main contrib non-free
EOF ;;
        *) 
            echo "无效的选择，请重新运行脚本并选择有效的编号。"
            ;;
    esac

elif [[ "$SYSTEM" == "debian" && "$VERSION" == "12" ]]; then
    echo "您正在使用 Debian 12 (Bookworm)"
    echo "请选择要替换的镜像源："
    echo "1) 官方源"
    echo "2) 清华源"
    echo "3) 中科大源"
    echo "4) 腾讯源"
    echo "5) 阿里源"
    echo "6) Linode源"
    read -p "请输入编号: " choice
    case $choice in
        1) 
            echo "替换为官方源"
            cat > /etc/apt/sources.list << EOF
deb https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        2) 
            echo "替换为清华源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        3) 
            echo "替换为中科大源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        4) 
            echo "替换为腾讯源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.cloud.tencent.com/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        5) 
            echo "替换为阿里源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.aliyun.com/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        6) 
            echo "替换为linode源"
            cat > /etc/apt/sources.list << EOF
deb http://mirrors.linode.com/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://mirrors.linode.com/debian/ bookworm main contrib non-free non-free-firmware

deb http://mirrors.linode.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://mirrors.linode.com/debian/ bookworm-updates main contrib non-free non-free-firmware

deb http://mirrors.linode.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src http://mirrors.linode.com/debian/ bookworm-backports main contrib non-free non-free-firmware

deb http://mirrors.linode.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src http://mirrors.linode.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
            ;;
        *) 
            echo "无效的选择，请重新运行脚本并选择有效的编号。"
            ;;
    esac

elif [[ "$SYSTEM" == "ubuntu" && "$VERSION" == "22" ]]; then
    echo "您正在使用 Ubuntu 22"
    echo "请选择要替换的镜像源："
    echo "1) 官方源"
    echo "2) 清华源"
    echo "3) 中科大源"
    echo "4) 腾讯源"
    echo "5) 阿里源"
    echo "6) Linode源"
    read -p "请输入编号: " choice
    case $choice in
        1) 
            # 填写 Ubuntu 22 官方源的内容
            echo "替换为 Ubuntu 22 官方源"
            cat > /etc/apt/sources.list << EOF
deb http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse

## Not recommended
# deb http://archive.ubuntu.com/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
            ;;
        2) 
            echo "替换为清华源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

## Not recommended
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
            ;;
        3) 
            echo "替换为中科大源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

## Not recommended
# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
            ;;
        4) 
            echo "替换为腾讯源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.cloud.tencent.com/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy main restricted universe multiverse

deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-security main restricted universe multiverse

deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-updates main restricted universe multiverse

deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-backports main restricted universe multiverse

## Not recommended
# deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
            ;;
        5) 
            echo "替换为阿里源"
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse

## Not recommended
# deb https://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
            ;;

        *) 
            echo "无效的选择，请重新运行脚本并选择有效的编号。"
            ;;
    esac

else
    echo "不支持的系统或版本。"
fi
# 更新apt包列表
echo "正在更新 apt 包列表..."
apt update

echo "源替换完成，apt 更新已完成！"
