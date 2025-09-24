#!/bin/bash

set -e

echo "Adding AmneziaWG packages to build..."
echo "Current directory: $(pwd)"

# Клонируем репозиторий amneziawg
git clone https://github.com/amnezia-vpn/amneziawg-openwrt.git /tmp/amneziawg-openwrt

# Проверяем существование директорий и создаем при необходимости
mkdir -p friendlywrt/package/

# Копируем пакеты
echo "Copying AmneziaWG packages..."
cp -r /tmp/amneziawg-openwrt/amneziawg-tools friendlywrt/package/ || echo "Failed to copy amneziawg-tools"
cp -r /tmp/amneziawg-openwrt/kmod-amneziawg friendlywrt/package/ || echo "Failed to copy kmod-amneziawg"
cp -r /tmp/amneziawg-openwrt/luci-proto-amneziawg friendlywrt/package/ || echo "Failed to copy luci-proto-amneziawg"

# Проверяем, что скопировалось
echo "Package directory contents after copy:"
ls -la friendlywrt/package/ || echo "Package directory not accessible"

# Переименовываем
if [ -d "friendlywrt/package/luci-proto-amneziawg" ]; then
    mv friendlywrt/package/luci-proto-amneziawg friendlywrt/package/luci-app-amneziawg
    echo "Successfully renamed luci-proto to luci-app"
else
    echo "luci-proto-amneziawg directory not found for renaming"
fi

echo "AmneziaWG packages added successfully"
