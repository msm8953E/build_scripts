#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --no-repo-verify --git-lfs -u https://github.com/Trijal08/project_infinity_x-manifest -b 15 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b InfinityX/15 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN 
export BUILD_HOSTNAME=crave 
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# fix error 
rm -rf external/chromium-webview

# Lunch
lunch infinity_Mi439_4_19-ap2a-userdebug
lunch infinity_Mi439_4_19-userdebug
lunch infinity_Mi439_4_19-ap3a-userdebug
make installclean
mka bacon
