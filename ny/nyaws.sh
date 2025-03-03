#!/bin/bash

# 函数：运行命令并完全自动化输入
run_install() {
    local cmd="$1"
    local service_name="$2"
    
    echo "正在执行命令: $cmd"
    # 使用 expect 模拟所有交互式输入，强制英文环境以避免中文编码问题
    env LANG=C expect <<EOF
        set timeout 60
        spawn $cmd
        expect "请输入服务名 *:" { send "$service_name\r" }
        expect "y/N" { send "y\r" }
        expect "y/N" { send "y\r" }
        expect "安装成功" { puts "安装成功检测到" }
        expect eof
EOF
    
    # 检查是否安装成功
    if [ $? -eq 0 ]; then
        echo "检测到安装成功，继续下一步..."
    else
        echo "安装失败，脚本退出！"
        exit 1
    fi
}

# 检查是否安装了 expect，若未安装则自动安装
if ! command -v expect &> /dev/null; then
    echo "未找到 expect，正在自动安装..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y expect || {
            echo "安装 expect 失败，请检查系统包管理器！"
            exit 1
        }
    elif command -v yum &> /dev/null; then
        sudo yum install -y expect || {
            echo "安装 expect 失败，请检查系统包管理器！"
            exit 1
        }
    else
        echo "无法自动安装 expect，请手动安装后重试！"
        exit 1
    fi
fi

# 检查 curl 是否存在
if ! command -v curl &> /dev/null; then
    echo "未找到 curl，请先安装 curl！"
    exit 1
fi

# 第1次安装，服务名 ny1
run_install "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t 8c643eca-2645-4842-b2b6-f30571ce09e9 -u https://np.zui.photos\"" "ny1"

# 第2次安装，服务名 ny2
run_install "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t e60552e0-3e4e-4c0b-8f7c-5ec756dea0ce -u https://xuan.dxmax.buzz\"" "ny2"

# 第3次安装，服务名 ny3
run_install "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t 13abdb58-8773-4fb3-a018-7cf6d1728ff8 -u https://materelay.com\"" "ny3"

echo "所有安装已完成！"
