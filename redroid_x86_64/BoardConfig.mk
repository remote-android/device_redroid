include device/generic/x86_64/BoardConfig.mk

TARGET_USES_HWC2 := true

# want all fonts
SMALLER_FONT_FOOTPRINT := false
MINIMAL_FONT_FOOTPRINT := false

# use seperate vendor partition
TARGET_COPY_OUT_VENDOR := vendor

BOARD_GPU_DRIVERS := i915 i965 r300g r600g virgl iris radeonsi

DEVICE_MANIFEST_FILE := device/redroid/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true
