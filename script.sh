#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf android_device_xiaomi_daisy


# repo init rom
#repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
#repo init -u https://github.com/ProjectMatrixx/android.git -b 16.0 --git-lfs
#echo "=================="
echo "Repo init success"
echo "=================="


# Local manifests
#git clone https://github.com/Gtajisan/local_manifests -b WebView .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"


# tree 
#git clone https://github.com/Gtajisan/android_device_xiaomi_daisy-b 16 device/xiaomi/daisy
echo "============================"
echo "tree or some ex clone       "
echo "============================"

# build
#/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# remove face unlock 
#rm -rf packages/apps/FaceUnlock

# play vendor_infinity-priv_keys
#
# Export
export BUILD_USERNAME=Gtajisan 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
echo "======= Export Done ======"

# platform/external/chromium-webview
#rm -rf  external/chromium-webview 
#git clone https://github.com/Gtajisan/android_external_chromium-webview -b Custom external/chromium-webview

# aging 
#rm -rf device/xiaomi/daisy
#git clone https://github.com/Gtajisan/android_device_xiaomi_daisy -b 16 device/xiaomi/daisy
rm -rf external/ant-wireless/ant_client
rm -rf external/ant-wireless/ant_native
rm -rf external/ant-wireless/ant_service
# Go to the root of your ROM source
#cd ~/android/lineage  # or wherever your ROM is

# these not need in crave 

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

. build/envsetup.sh
brunch daisy 

