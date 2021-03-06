# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


LOCAL_PATH := device/samsung/a02q

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Define Dynamic Partition support
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl-wrapper.recovery \
    android.hardware.boot@1.0-impl-wrapper \
    android.hardware.boot@1.0-impl.recovery 

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Build qcom FBE decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Disable adb security
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.mount.fs=EXT4 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	ro.config.low_ram=false

# For userdebug builds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1


# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb
