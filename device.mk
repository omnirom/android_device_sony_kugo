# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/sony/kugo

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/BCM4345C0.hcd:system/etc/firmware/BCM4345C0.hcd \
    $(DEVICE_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/camera/camera_config.xml:system/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx241_chromatix.xml:system/etc/camera/imx241_chromatix.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx300_chromatix.xml:system/etc/camera/imx300_chromatix.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/General_cal.acdb:system/etc/acdbdata/General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.kugo \
    init.kugo \
    ueventd.kugo

# Lights
PRODUCT_PACKAGES += \
    lights.kugo

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.kugo

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprint.kugo

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.kugo

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1E8

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/loire-common/platform.mk)

# copy wlan firmware
$(call inherit-product-if-exists, vendor/sony/broadcom/wlan/bcmdhd/firmware/bcm43455/device-bcm.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/sony/nxp/nxp-vendor.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/sony/loire-common/loire-partial.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
