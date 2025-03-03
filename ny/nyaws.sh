#!/bin/bash

# 检查expect是否已安装，如果没有则安装
if ! command -v expect &> /dev/null; then
    echo "正在安装expect工具..."
    apt-get update
    apt-get install -y expect
fi

# 函数: 自动安装NY面板
install_ny_panel() {
    local token="$1"
    local url="$2"
    local panel_name="$3"
    
    # 检查服务是否已存在
    if systemctl list-units --full --all | grep -q "${panel_name}.service"; then
        echo "检测到服务 ${panel_name} 已存在，正在卸载..."
        systemctl disable --now ${panel_name}
        rm -rf /opt/${panel_name}
        rm -f /etc/systemd/system/${panel_name}.service
        systemctl daemon-reload
    fi
    
    # 使用临时脚本文件来避免进程替换问题
    TMP_SCRIPT=$(mktemp)
    curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh > "$TMP_SCRIPT"
    
    # 使用expect自动处理交互部分，使用更简单的模式匹配
    expect -c "
        set timeout 300
        spawn bash $TMP_SCRIPT rel_nodeclient -o -t $token -u $url
        expect \"*服务名*:*\"
        send \"${panel_name}\r\"
        expect \"*优化*:*\"
        send \"n\r\"
        expect \"*安装*:*\"
        send \"n\r\"
        expect eof
    "
    
    # 删除临时脚本
    rm -f "$TMP_SCRIPT"
    
    echo "服务 ${panel_name} 安装完成!"
}

# 安装第一个NY面板
echo "===== 正在安装第一个NY面板 ====="
install_ny_panel "8c643eca-2645-4842-b2b6-f30571ce09e9" "https://np.zui.photos" "ny1"

# 安装第二个NY面板
echo "===== 正在安装第二个NY面板 ====="
install_ny_panel "e60552e0-3e4e-4c0b-8f7c-5ec756dea0ce" "https://xuan.dxmax.buzz" "ny2"

# 安装第三个NY面板
echo "===== 正在安装第三个NY面板 ====="
install_ny_panel "13abdb58-8773-4fb3-a018-7cf6d1728ff8" "https://materelay.com" "ny3"

echo "所有NY面板已成功安装!"
