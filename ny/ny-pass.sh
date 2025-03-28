#!/bin/bash

# 清理旧服务函数
cleanup_service() {
  local service_name="$1"
  if systemctl list-units --full --all | grep -q "${service_name}.service"; then
    echo "正在卸载已存在的服务 ${service_name}..."
    systemctl disable --now ${service_name}
    rm -rf /opt/${service_name}
    rm -f /etc/systemd/system/${service_name}.service
    systemctl daemon-reload
  fi
}

# 安装第一个面板 (ny1)
cleanup_service "ny1"
echo "开始安装 ny1 面板..."
echo -e "ny1\ny\ny" | bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t 8c643eca-2645-4842-b2b6-f30571ce09e9 -u https://np.zui.photos"

# 等待 ny1 服务启动
echo "等待 ny1 安装完成并检查状态..."
sleep 3
if systemctl is-active ny1 >/dev/null 2>&1; then
  echo "ny1 服务已成功启动"
else
  echo "警告：ny1 服务可能未正确启动，继续执行后续安装"
fi

# 安装第二个面板 (bfg-client)
cleanup_service "bfg-client"
echo "开始安装 bfg-client 面板..."
wget -O install.sh --no-check-certificate https://pass.bfgapi.xyz/client/UpUuhmWlubgz2fMN/install.sh && bash install.sh
sleep 3

# 检查服务状态
echo "所有NY面板安装完成，检查状态："
systemctl status ny1 bfg-client --no-pager
