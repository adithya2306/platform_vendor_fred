# Copyright 2019 The Fred Project
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

# Include vendor overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/fred/overlay/common

# Enable SIP+VoIP
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Include APN information
PRODUCT_COPY_FILES += vendor/fred/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Copy init file
PRODUCT_COPY_FILES += vendor/fred/prebuilt/root/init.fred.rc:root/init.fred.rc

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

export VENDOR := fred

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    SnapdragonGallery \
    SnapdragonMusic \
    SoundRecorder

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/fred/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/fred/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/fred/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/fred/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/fred/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/fred/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Include hostapd configuration
PRODUCT_COPY_FILES += \
    vendor/fred/prebuilt/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    vendor/fred/prebuilt/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    vendor/fred/prebuilt/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/fred/sdclang/sdclang.mk
endif

# Include vendor SEPolicy changes
include vendor/fred/sepolicy/sepolicy.mk

# Branding
include vendor/fred/config/branding.mk

# Fonts
include vendor/fred/config/fonts.mk

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# MSIM manual provisioning
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += libprotobuf-cpp-full

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/fred/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Substratum Key
PRODUCT_COPY_FILES += \
    vendor/fred/prebuilt/priv-app/SubstratumKey.apk:system/priv-app/SubstratumKey/SubstratumKey.apk
