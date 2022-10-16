# Copyright (C) 2013 The Android Open Source Project
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

PRODUCT_MANUFACTURER := redroid

#$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# no kernel involved
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

PRODUCT_BUILD_CACHE_IMAGE := false
PRODUCT_BUILD_ODM_IMAGE := false
PRODUCT_BUILD_PRODUCT_IMAGE  := false
PRODUCT_BUILD_PRODUCT_SERVICES_IMAGE := false
PRODUCT_BUILD_RAMDISK_IMAGE := false
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_SYSTEM_OTHER_IMAGE := false
PRODUCT_BUILD_USERDATA_IMAGE := false
PRODUCT_BUILD_VBMETA_IMAGE := false
PRODUCT_BUILD_VENDOR_IMAGE := true
ifeq ($(BUILD_VENDOR_ONLY), true)
PRODUCT_BUILD_SYSTEM_IMAGE := false
else
PRODUCT_BUILD_SYSTEM_IMAGE := true
endif

PRODUCT_SHIPPING_API_LEVEL := 29

AUDIOSERVER_MULTILIB := first

# ?
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.nobootanimation=1

PRODUCT_PACKAGES += \
    gatekeeper.redroid \
    libEGL_swiftshader \
    libGLESv1_CM_swiftshader \
    libGLESv2_swiftshader \
    vulkan.pastel \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware=redroid \

# Phone App required
PRODUCT_PACKAGES += \
    rild

# WiFi required by SystemUI
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \


# required HIDL
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    android.hardware.audio@2.0-service \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.configstore@1.1-service \
    android.hardware.drm@1.2-service-lazy.clearkey \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.health@2.0-service.goldfish \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \


DEVICE_MANIFEST_FILE += device/redroid/android.hardware.drm@1.2-service.clearkey.xml

ifneq ($(REDROID_DISABLE_OMX),true)
    $(call inherit-product, hardware/redroid/omx/omx.mk)
else
    $(call inherit-product, hardware/redroid/c2/c2.mk)
endif


DEVICE_MANIFEST_FILE += device/redroid/android.hardware.bluetooth@1.0.xml

PRODUCT_PACKAGES += android.hardware.bluetooth@1.0-service.sim


PRODUCT_PACKAGES += \
    android.hardware.gnss@2.0-service \
    android.hardware.sensors@2.0-service.mock \


USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_generic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/surround_sound_configuration_5_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_configuration_5_0.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/redroid-removed-permissions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/redroid-removed-permissions.xml \
    $(LOCAL_PATH)/init.redroid.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.redroid.rc \


$(call inherit-product, device/redroid/phone-xhdpi-6144-dalvik-heap.mk)

$(call inherit-product-if-exists, product.mk)

$(call inherit-product, vendor/redroid/vendor.mk)

$(call inherit-product, device/redroid-prebuilts/prebuilts.mk)
