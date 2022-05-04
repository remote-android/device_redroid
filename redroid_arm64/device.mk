PRODUCT_COPY_FILES += \
	device/redroid/mediacodec.policy.arm:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \

$(call inherit-product, device/redroid-prebuilts/prebuilts_arm.mk)
