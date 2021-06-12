#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2019 The LineageOS Project
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

ifeq ($(PRODUCT_DEVICE),nio)
TARGET_BOOTANIMATION := vendor/customization/bootanimation/bootanimation-motorola.zip
else
TARGET_BOOTANIMATION := vendor/customization/bootanimation/bootanimation-google.zip
endif

include $(CLEAR_VARS)
LOCAL_MODULE := bootanimation-stock.zip
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/media
LOCAL_MODULE_STEM := bootanimation.zip
LOCAL_OVERRIDES_PACKAGES := bootanimation.zip
LOCAL_PRODUCT_MODULE := true

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_BOOTANIMATION)
	@cp $(TARGET_BOOTANIMATION) $@
