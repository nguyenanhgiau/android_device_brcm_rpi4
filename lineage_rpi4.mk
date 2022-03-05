#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit common configuration
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1080

# Inherit device configuration
DEVICE_PATH := device/brcm/rpi4
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, vendor/brcm/rpi4/rpi4-vendor.mk)
$(call inherit-product-if-exists, vendor/konstakang/rpi4.mk)

PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1

PRODUCT_PACKAGES += \
    gralloc.gbm \
    hwcomposer.drm \
    libGLES_mesa

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ramdisk/fstab.rpi4:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi4 \
    $(DEVICE_PATH)/ramdisk/fstab.rpi4:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi4 \
    $(DEVICE_PATH)/ramdisk/init.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.rc \
    $(DEVICE_PATH)/ramdisk/init.rpi4.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.usb.rc \
    $(DEVICE_PATH)/ramdisk/ueventd.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/brcm/rpi-common/rpi-common-vendor.mk)

PRODUCT_CHARACTERISTICS := tablet,nosdcard

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rpi4
PRODUCT_NAME := lineage_rpi4
PRODUCT_BRAND := Raspberry
PRODUCT_MODEL := Raspberry Pi 4
PRODUCT_MANUFACTURER := Raspberry
PRODUCT_RELEASE_NAME := Raspberry Pi 4
