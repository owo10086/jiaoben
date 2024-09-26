#!/bin/bash

# 随机生成7位字符字符串，包含大小写字母和数字
generate_random_string() {
    echo $(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c7)
}

# 安装系统工具
if [ -f /etc/debian_version ]; then
    echo "系统为 Debian"
    timedatectl set-timezone Asia/Shanghai
    apt update -y
    apt install -y sudo wget curl

    # 安装 BBR
    wget -O tcpx.sh "https://git.io/JYxKU" && chmod +x tcpx.sh
    echo "11" | ./tcpx.sh
    echo "16" | ./tcpx.sh

    # 安装 Docker 和 Docker Compose
    curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
    echo "Docker 安装完成。"

    # 定义端口
    port=2020

    # 运行 SOCKS5 容器
    docker run -d \
        --name sockd \
        --publish "$port:$port" \
        --volume sockd.passwd:/root/conf/sockd.passwd \
        lozyme/sockd

    # 创建 SOCKS5 用户和密码
    username=$(generate_random_string)
    password=$(generate_random_string)
    
    echo "为 SOCKS5 创建用户: $username 和密码: $password"

    # 将用户名和密码传递到 Docker 容器
    docker exec sockd script/pam add "$username" "$password"
    
    echo "用户 $username 已创建，密码为 $password"

# 获取本机 IP 地址
local_ip=$(curl -s cip.cc | grep -oP '(?<=IP: ).*?(?=</p>)')
echo "$local_ip:$port:$username:$password"


else
    echo "当前系统不是 Debian，脚本不支持该系统。"
    exit 1
fi
