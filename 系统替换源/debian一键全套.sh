#!/bin/bash

# 备份现有的 apt 源配置
backup_sources() {
    if [ -f /etc/apt/sources.list ]; then
        echo "备份现有的 apt 源配置..."
        mv /etc/apt/sources.list /etc/apt/sources.list.old
    fi
}

# 替换为默认官方源
use_official_source() {
    cat > /etc/apt/sources.list << EOF
deb https://deb.debian.org/debian/ bullseye main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye main contrib non-free

deb https://deb.debian.org/debian/ bullseye-updates main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye-updates main contrib non-free

deb https://deb.debian.org/debian/ bullseye-backports main contrib non-free
deb-src https://deb.debian.org/debian/ bullseye-backports main contrib non-free

deb https://deb.debian.org/debian-security/ bullseye-security main contrib non-free
deb-src https://deb.debian.org/debian-security/ bullseye-security main contrib non-free
EOF
}

# 替换为国内源
use_china_source() {
    echo "请选择国内源："
    echo "1) 清华源"
    echo "2) 中科大源"
    echo "3) 腾讯云源"
    echo "4) 阿里云源"
    echo "5) Linode 源（不支持 HTTPS）"
    read -p "请输入对应的数字: " source_choice
    
    case $source_choice in
        1)
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bullseye-security main contrib non-free
EOF
            ;;
        2)
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
EOF
            ;;
        3)
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.cloud.tencent.com/debian/ bullseye main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye main contrib non-free

deb https://mirrors.cloud.tencent.com/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye-updates main contrib non-free

deb https://mirrors.cloud.tencent.com/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian/ bullseye-backports main contrib non-free

deb https://mirrors.cloud.tencent.com/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.cloud.tencent.com/debian-security/ bullseye-security main contrib non-free
EOF
            ;;
        4)
            cat > /etc/apt/sources.list << EOF
deb https://mirrors.aliyun.com/debian/ bullseye main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye main contrib non-free

deb https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free

deb https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free

deb https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free
EOF
            ;;
        5)
            cat > /etc/apt/sources.list << EOF
deb http://mirrors.linode.com/debian/ bullseye main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye main contrib non-free

deb http://mirrors.linode.com/debian/ bullseye-updates main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye-updates main contrib non-free

deb http://mirrors.linode.com/debian/ bullseye-backports main contrib non-free
deb-src http://mirrors.linode.com/debian/ bullseye-backports main contrib non-free

deb http://mirrors.linode.com/debian-security/ bullseye-security main contrib non-free
deb-src http://mirrors.linode.com/debian-security/ bullseye-security main contrib non-free
EOF
            ;;
        *)
            echo "无效的选择，退出程序。"
            exit 1
            ;;
    esac
}

# 自动识别IP并询问用户
detect_ip() {
    server_ip=$(curl -s http://ipinfo.io/ip)
    echo "服务器的IP是: $server_ip"
    read -p "请选择源类型：1) 国内源 2) 官方源: " choice
    case $choice in
        1)
            use_china_source
            ;;
        2)
            use_official_source
            ;;
        *)
            echo "无效的选择，退出程序。"
            exit 1
            ;;
    esac
}

# 更新apt索引
update_apt() {
    apt update
}

# 主函数
main() {
    backup_sources
    detect_ip
    update_apt
}

main
