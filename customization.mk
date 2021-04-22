# Copyright (C) 2020 ELectimon
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

LOCAL_PATH := vendor/customization

# Apps
PRODUCT_PACKAGES += \
    MotoTimeWeather

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Pixel APNs
PRODUCT_COPY_FILES += \
    vendor/customization/telephony/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# IORap app launch prefetching using Perfetto traces and madvise
PRODUCT_PRODUCT_PROPERTIES += \
    ro.iorapd.enable=true

# BootAnimation
PRODUCT_PACKAGES += \
    bootanimation-stock.zip

# MotCamera3
PRODUCT_PACKAGES += \
    MotCamera3

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/customization/sepolicy/private

# Pixel Sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/customization/sounds/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=The_big_adventure.ogg \
    ro.config.notification_sound=End_note.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# StitchImage
PRODUCT_PACKAGES += \
    StitchImage \
    StitchImageService
