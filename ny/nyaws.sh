#!/bin/bash

# 定义安装命令的数组
declare -a commands=(
    "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t 8c643eca-2645-4842-b2b6-f30571ce09e9 -u https://np.zui.photos\""
    "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t e60552e0-3e4e-4c0b-8f7c-5ec756dea0ce -u https://xuan.dxmax.buzz\""
    "bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient \"-o -t 13abdb58-8773-4fb3-a018-7cf6d1728ff8 -u https://materelay.com\""
)

# 定义服务名
declare -a service_names=("ny1" "ny2" "ny3")

# 遍历执行每条命令
for i in "${!commands[@]}"; do
    echo "正在执行第 $((i+1)) 条安装命令..."
    {
        echo "${service_names[$i]}"  # 输入服务名
        sleep 1
        echo ""  # 第一次回车
        sleep 1
        echo ""  # 第二次回车
    } | eval "${commands[$i]}"
    
    # 检查是否安装成功
    if [ $? -eq 0 ]; then
        echo "安装成功"
    else
        echo "第 $((i+1)) 条命令执行失败，请检查！"
        exit 1
    fi
    sleep 2
done

echo "所有安装命令执行完成！"
