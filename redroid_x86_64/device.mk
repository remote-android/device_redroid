PRODUCT_COPY_FILES += \
    device/redroid/mediacodec.policy.x86:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable.native.bridge.exec=1 \
    ro.dalvik.vm.isa.arm64=x86_64 \
    ro.dalvik.vm.isa.arm=x86 \
    ro.dalvik.vm.native.bridge=libnb.so \

$(call inherit-product, device/redroid-prebuilts/prebuilts_x86.mk)
