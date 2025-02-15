#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/VoltageOS/manifest.git -b 15-qpr1 --git-lfs
        
echo "=================="
echo "Repo init success"
echo "=================="

# repo
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b voltage/15x device/xiaomi/daisy

echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="
# repo
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b voltage/15x device/xiaomi/daisy

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave 
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "============="

# Lunch
. build/envsetup.sh
brunch daisy
