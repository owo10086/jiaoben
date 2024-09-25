#!/bin/bash

# 备份现有的apt源配置
echo "正在备份现有的apt源配置..."
mv /etc/apt/sources.list /etc/apt/sources.list.old
echo "备份完成！"

# 获取服务器IP，判断是国内还是国外IP（简单检测方式）
IP=$(curl -s ifconfig.me)
echo "您的服务器IP是: $IP"

# 提示用户选择国内源还是国外源
echo "请选择源类型："
echo "1) 国内源"
echo "2) 国外源"
read -p "请输入选项 (1 或 2): " source_choice

# 根据选择替换为对应的源
if [ "$source_choice" == "1" ]; then
  echo "你选择了国内源，下面提供几种国内源，请选择："
  echo "1) 清华源"
  echo "2) 中科大源"
  echo "3) 腾讯云源"
  echo "4) 阿里云源"
  read -p "请输入选项 (1-4): " china_choice

  case $china_choice in
    1)
      cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
      ;;
    2)
      cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
      ;;
    3)
      cat > /etc/apt/sources.list << EOF
deb https://mirrors.cloud.tencent.com/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.cloud.tencent.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.cloud.tencent.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
      ;;
    4)
      cat > /etc/apt/sources.list << EOF
deb https://mirrors.aliyun.com/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF
      ;;
    *)
      echo "无效选项，退出。"
      exit 1
      ;;
  esac

elif [ "$source_choice" == "2" ]; then
  # 国外源（默认官方源）
  cat > /etc/apt/sources.list << EOF
deb https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware

deb https://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
EOF

else
  echo "无效选项，退出。"
  exit 1
fi

# 更新apt索引
echo "正在更新apt索引..."
apt update
echo "apt源已成功更新！"
