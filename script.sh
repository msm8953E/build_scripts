#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf android_device_xiaomi_daisy


# repo init rom
#repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs

echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b cr/14 device/xiaomi/daisy
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


# Export
export BUILD_USERNAME=ome 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
echo "======= Export Done ======"

#toggle for mainteriner 
#cd packages/apps/Settings
#git fetch crdroid --unshallow
#git fetch https://github.com/Gtajisan/android_packages_apps_Settings.git 14.0
#git cherry-pick a46bc2b05cb508aa8cdf21d9d0b0ebfb332c8b42
#cd ../../..


# aging 
rm -rf device/xiaomi/daisy
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b cr/14 device/xiaomi/daisy

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
. build/envsetup.sh
lunch lineage_daisy-userdebug
lunch lineage_daisy-ap2a-userdebug
# Run to prepare our devices list
# ... now run
brunch daisy


