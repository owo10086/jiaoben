#!/bin/bash

# 1. 检查是否以 root 身份运行
if [ "$(id -u)" -ne 0 ]; then
  echo "错误：你必须以 root 身份运行此脚本"
  exit 1
fi

# 2. 固定设置（无需交互）
SSH_PORT=23333         # 固定 SSH 端口
maxretry=2             # 固定最大重试次数
bantime_hours=2400     # 固定封禁时长（小时）
bantime=$(( bantime_hours * 3600 ))  # 转换为秒

# 3. 检测操作系统及版本
. /etc/os-release
case "$ID" in
  centos|rhel|amzn)
    OS=CentOS
    VER=${VERSION_ID%%.*}
    LOG=/var/log/secure
    ;;
  debian|deepin|kali)
    OS=Debian
    VER=${VERSION_ID%%.*}
    LOG=/var/log/auth.log
    ;;
  ubuntu|linuxmint|elementary)
    OS=Ubuntu
    VER=${VERSION_ID%%.*}
    LOG=/var/log/auth.log
    ;;
  *)
    echo "错误：不支持的操作系统"; exit 1
    ;;
esac

# 4. 应用新的 SSH 端口
if grep -qE '^[[:space:]]*Port[[:space:]]+' /etc/ssh/sshd_config; then
  sed -ri "s/^[[:space:]]*Port[[:space:]]+[0-9]+/Port $SSH_PORT/" /etc/ssh/sshd_config
else
  echo "Port $SSH_PORT" >> /etc/ssh/sshd_config
fi

# 5. 安装 Fail2ban（如果尚未安装）
if ! command -v fail2ban-server >/dev/null; then
  if [[ $OS == CentOS ]]; then
    yum -y install epel-release
    yum -y install fail2ban
  else
    apt-get update
    apt-get -y install fail2ban
  fi
fi

# 6. 配置 Fail2ban（针对 SSH）
mkdir -p /etc/fail2ban/jail.d
cat > /etc/fail2ban/jail.d/ssh.conf <<EOF
[sshd]
enabled   = true
port      = $SSH_PORT
filter    = sshd
logpath   = $LOG
maxretry  = $maxretry
findtime  = 3600
bantime   = $bantime
ignoreip  = 127.0.0.1/8
EOF

# 7. 重启并启用服务
if command -v systemctl >/dev/null; then
  systemctl restart sshd fail2ban
  systemctl enable fail2ban
else
  service ssh restart
  service fail2ban restart
  chkconfig fail2ban on
fi

echo "▶ SSH 端口已设置为 $SSH_PORT"
echo "▶ Fail2ban 在 $maxretry 次失败后会封禁"
echo "▶ 封禁时长：$bantime_hours 小时（$bantime 秒）"
echo "▶ 卸载脚本：wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
