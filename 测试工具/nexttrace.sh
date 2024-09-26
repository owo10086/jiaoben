#!/bin/bash

# 菜单函数
function menu() {
    clear
    echo "请选择你要执行的操作:"
    echo "1) 安装 nexttrace (Linux)"
    echo "2) 安装 nexttrace (GHPROXY 国内镜像)"
    echo "3) 安装 nexttrace (macOS Brew)"
    echo "4) nexttrace 使用示例"
    echo "5) 退出"
    echo ""
    read -p "请输入选项 [1-5]: " choice
    case $choice in
        1) install_linux ;;
        2) install_ghproxy ;;
        3) install_macos ;;
        4) usage_demo ;;
        5) exit 0 ;;
        *) echo "无效的选项, 请重新选择." && sleep 2 && menu ;;
    esac
}

# 安装 nexttrace (Linux)
function install_linux() {
    echo "正在安装 nexttrace (Linux)..."
    bash <(curl -Ls https://raw.githubusercontent.com/sjlleo/nexttrace/main/nt_install.sh)
    echo "安装完成!"
    read -p "按任意键返回菜单..." && menu
}

# 安装 nexttrace (GHPROXY 国内镜像)
function install_ghproxy() {
    echo "正在安装 nexttrace (GHPROXY 国内镜像)..."
    bash <(curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/sjlleo/nexttrace/main/nt_install.sh)
    echo "安装完成!"
    read -p "按任意键返回菜单..." && menu
}

# 安装 nexttrace (macOS Brew)
function install_macos() {
    echo "正在安装 nexttrace (macOS Brew)..."
    brew tap xgadget-lab/nexttrace && brew install nexttrace
    echo "安装完成!"
    read -p "按任意键返回菜单..." && menu
}

# 使用示例 DEMO
function usage_demo() {
    clear
    echo "nexttrace 使用示例:"
    echo ""
    echo "1. 使用 ICMP 协议进行 IPv4 路由跟踪:"
    echo "   nexttrace 1.0.0.1"
    echo ""
    echo "2. 使用 URL 进行路由跟踪:"
    echo "   nexttrace http://example.com:8080/index.html?q=1"
    echo ""
    echo "3. 使用 --table 参数以表格形式显示结果:"
    echo "   nexttrace --table 1.0.0.1"
    echo ""
    echo "4. 使用 IPv6 ICMP 路由跟踪:"
    echo "   nexttrace 2606:4700:4700::1111"
    echo ""
    echo "5. 禁用路径可视化:"
    echo "   nexttrace --map koreacentral.blob.core.windows.net"
    echo "   (生成的 MapTrace URL 将显示路径可视化)"
    echo ""
    echo "6. 快速测试回程路由:"
    echo "   nexttrace --fast-trace"
    echo ""
    echo "7. 使用 TCP SYN 进行路由跟踪:"
    echo "   nexttrace --tcp www.bing.com"
    echo ""
    echo "8. 使用指定网卡进行路由跟踪:"
    echo "   nexttrace --dev eth0 2606:4700:4700::1111"
    echo ""
    echo "按任意键返回菜单..."
    read -n 1 && menu
}

# 运行菜单
menu
