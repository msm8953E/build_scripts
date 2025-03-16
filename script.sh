#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b aosp device/xiaomi/daisy
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# aging 
rm -rf device/xiaomi/daisy
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b aosp device/xiaomi/daisy

# Export
export BUILD_USERNAME=dev
export BUILD_HOSTNAME=crave 
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "============="

# Lunch
. build/envsetup.sh
lunch aosp_daisy-ap4a-userdebug
mka bacon
