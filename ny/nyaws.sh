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
echo -e "ny1\ny\ny" | bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t 8c643eca-2645-4842-b2b6-f30571ce09e9 -u https://np.zui.photos"
sleep 3

# 安装第二个面板 (ny2)
cleanup_service "ny2"
echo -e "ny2\ny\ny" | bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t e60552e0-3e4e-4c0b-8f7c-5ec756dea0ce -u https://xuan.dxmax.buzz"
sleep 3

# 安装第三个面板 (ny3)
cleanup_service "ny3"
echo -e "ny3\ny\ny" | bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t 13abdb58-8773-4fb3-a018-7cf6d1728ff8 -u https://materelay.com"
sleep 3

# 检查服务状态
echo "所有NY面板安装完成，检查状态："
systemctl status ny1 ny2 ny3 --no-pager
