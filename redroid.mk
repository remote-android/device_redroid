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

#$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
#PRODUCT_COMPRESSED_APEX := false

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

# update while Android S released
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_SOONG_NAMESPACES += external/mesa3d

AUDIOSERVER_MULTILIB := first

# ?
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.nobootanimation=1

# required by sync.sh script
PRODUCT_HOST_PACKAGES += \
    fs_config

PRODUCT_PACKAGES += \
    hwcomposer.redroid \
    gralloc.gbm \
    gralloc.redroid \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle \
    vulkan.pastel \
    libGLES_mesa \
    vulkan.radv \
    ipconfigstore \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.qemu=1 \
    ro.hardware=redroid \
    ro.sf.lcd_density=320 \
    persist.sys.fuse=1 \

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
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.drm@1.4-service-lazy.clearkey \
    android.hardware.gatekeeper@1.0-service.software \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \

PRODUCT_SOONG_NAMESPACES += frameworks/av/services/audiopolicy/config
# audio policy
PRODUCT_PACKAGES += \
    audio_policy_configuration.xml \
    r_submix_audio_policy_configuration.xml \
    audio_policy_volumes.xml \
    default_volume_tables.xml \
    primary_audio_policy_configuration.xml \
    surround_sound_configuration_5_0.xml \


PRODUCT_COPY_FILES += \
    device/generic/goldfish/camera/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/generic/goldfish/camera/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    $(LOCAL_PATH)/init.redroid.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.redroid.rc \
    $(LOCAL_PATH)/gpu_config.sh:$(TARGET_COPY_OUT_VENDOR)/bin/gpu_config.sh \

$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

$(call inherit-product-if-exists, product.mk)

