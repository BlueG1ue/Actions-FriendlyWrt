#!/bin/bash

set -e

echo "Adding AmneziaWG packages to build..."

# Клонируем репозиторий amneziawg
git clone https://github.com/amnezia-vpn/amneziawg-openwrt.git /tmp/amneziawg-openwrt

# Копируем пакеты в дерево пакетов friendlywrt
cp -r /tmp/amneziawg-openwrt/amneziawg-tools friendlywrt/package/
cp -r /tmp/amneziawg-openwrt/kmod-amneziawg friendlywrt/package/
cp -r /tmp/amneziawg-openwrt/luci-proto-amneziawg friendlywrt/package/

# Переименовываем luci-proto в luci-app
mv friendlywrt/package/luci-proto-amneziawg friendlywrt/package/luci-app-amneziawg

echo "AmneziaWG packages added successfully"
