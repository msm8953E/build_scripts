#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/VoltageOS/manifest.git -b 15-qpr1 --git-lfs        
echo "=================="
echo "Repo init success"
echo "=================="


# repo
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b voltage/15x device/xiaomi/daisy
"============================"
echo "Local manifest clone success"
echo "============================"

# repo sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="
# repo
rm -rf device/xiaomi/daisy
git clone https://github.com/msm8953E/android_device_xiaomi_daisy -b voltage/15x device/xiaomi/daisy


# vendor_voltage-priv_keys
#git clone https://github.com/VoltageOS/vendor_voltage-priv_keys vendor/voltage-priv/keys
#cd vendor/voltage-priv/keys
#./keys.sh
#cd ../../../
echo "======= vendor voltage priv keys ======"
       
# Export
export BUILD_USERNAME=daisy 
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
brunch daisy

 

