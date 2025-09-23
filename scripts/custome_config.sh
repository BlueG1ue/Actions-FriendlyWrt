#!/bin/bash

sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' configs/rockchip/01-nanopi

echo "CONFIG_PACKAGE_amneziawg-tools=y" >> configs/rockchip/01-nanopi
echo "CONFIG_PACKAGE_kmod-amneziawg=y" >> configs/rockchip/01-nanopi
echo "CONFIG_PACKAGE_luci-app-amneziawg=y" >> configs/rockchip/01-nanopi
