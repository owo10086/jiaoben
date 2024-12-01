# 停止哪吒服務
systemctl stop nezha-agent
systemctl stop nezha-dashboard

# 禁用服務
systemctl disable nezha-agent
systemctl disable nezha-dashboard

# 刪除服務檔案
rm -f /etc/systemd/system/nezha-agent.service
rm -f /etc/systemd/system/nezha-dashboard.service

# 刪除程式文件
rm -rf /opt/nezha
rm -rf /etc/nezha

# 刪除日誌文件
rm -rf /var/log/nezha

# 重新載入 systemd
systemctl daemon-reload

#卸载 Docker Compose 版哪吒面板
cd /opt/nezha/dashboard
docker compose down --volumes --rmi all
rm -rf /opt/nezha


echo "哪吒面板已完全移除"
