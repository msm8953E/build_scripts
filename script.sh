#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf android_device_xiaomi_daisy


# repo init rom
#repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="


# Local manifests
#git clone https://github.com/Gtajisan/local_manifests -b WebView .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"


# tree 
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b Los22 device/xiaomi/daisy
echo "============================"
echo "tree or some ex clone       "
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# remove face unlock 
#rm -rf packages/apps/FaceUnlock

# play vendor_infinity-priv_keys
git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys
cd vendor/evolution-priv/keys
./keys.sh
cd ../../..
echo "========================="
echo "vendor_evo-priv_keys"
echo "========================="

# Export
export BUILD_USERNAME=achu 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
echo "======= Export Done ======"

# platform/external/chromium-webview
#rm -rf  external/chromium-webview 
#git clone https://github.com/Gtajisan/android_external_chromium-webview -b Custom external/chromium-webview

# aging 
rm -rf device/xiaomi/daisy
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b Los22 device/xiaomi/daisy

# Go to the root of your ROM source
#cd ~/android/lineage  # or wherever your ROM is

# these not need in crave 

# Remove broken SettingsIntelligence
rm -rf packages/apps/SettingsIntelligence

# Clone a compatible repo (example from los)
git clone https://github.com/LineageOS/android_packages_apps_SettingsIntelligence.git -b lineage-22.2 packages/apps/SettingsIntelligence

# Optional: If you're also missing the layout file, you can grab a known working repo
# Replace with working frameworks/base if needed
# git clone https://github.com/crdroidandroid/android_frameworks_base -b 15.0 frameworks/base


# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
. build/envsetup.sh
lunch lineage_daisy-userdebug
lunch lineage_daisy-ap4a-userdebug
lunch lineage_daisy-bp1a-userdebug
m evolution

