# Copyright (C) 2012 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

REDROID_DISABLE_OMX := true
$(call inherit-product, $(LOCAL_PATH)/redroid.mk)

# overrides
PRODUCT_NAME := redroid_arm64_only
PRODUCT_DEVICE := redroid_arm64_only
PRODUCT_BRAND := redroid
PRODUCT_MODEL := redroid12_arm64_only

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

