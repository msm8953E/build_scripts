#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf android_device_xiaomi_daisy


# repo init rom
#repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/msm8953E/android_device_xiaomi_daisy.git -b Cr/14 device/xiaomi/daisy
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# remove face unlock 
#rm -rf packages/apps/FaceUnlock

# play vendor_infinity-priv_keys
#git clone https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys-template vendor/infinity-priv/keys
#cd vendor/infinity-priv/keys
#./keys.sh
#cd ../../../
echo "========================="
echo "vendor_infinity-priv_keys"
echo "========================="

# Export
export BUILD_USERNAME=ome 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_INCLUDE_VIPERFX := true
echo "======= Export Done ======"

# aging 
rm -rf device/xiaomi/earth
git clone https://github.com/msm8953E/android_device_xiaomi_daisy.git -b axion/15 device/xiaomi/daisy

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
. build/envsetup.sh
lunch lineage_daisy-ap2a-userdebug
axion daisy userdebug
axion daisy va
brunch daisy

