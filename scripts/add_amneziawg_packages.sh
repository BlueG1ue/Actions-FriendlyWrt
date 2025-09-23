set -e

echo "Adding AmneziaWG packages to build..."

# Клонируем репозиторий amneziawg
git clone https://github.com/amnezia-vpn/amneziawg-openwrt.git /tmp/amneziawg-openwrt

# Копируем пакеты в дерево пакетов friendlywrt
cp -r /tmp/amneziawg-openwrt/amneziawg-tools project/friendlywrt/package/
cp -r /tmp/amneziawg-openwrt/kmod-amneziawg project/friendlywrt/package/
cp -r /tmp/amneziawg-openwrt/luci-proto-amneziawg project/friendlywrt/package/

# Переименовываем luci-proto в luci-app
mv project/friendlywrt/package/luci-proto-amneziawg project/friendlywrt/package/luci-app-amneziawg

echo "AmneziaWG packages added successfully"
