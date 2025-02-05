#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/VoltageOS/manifest.git -b 15-qpr1 --git-lfs        
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b Voltage/15x .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# repo sync
/opt/crave/resync.sh && repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "============="
echo "Sync success"
echo "============="

# vendor_voltage-priv_keys
git clone https://github.com/VoltageOS/vendor_voltage-priv_keys vendor/voltage-priv/keys
cd vendor/voltage-priv/keys
./keys.sh
cd ../../../
echo "======= vendor voltage priv keys ======"
       
# Export
export BUILD_USERNAME=Farhan 
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
brunch mi439
 

