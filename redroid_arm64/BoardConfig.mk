include device/generic/arm64/BoardConfig.mk

# want all fonts
SMALLER_FONT_FOOTPRINT := false
MINIMAL_FONT_FOOTPRINT := false

# Android 11 enabled this
BUILD_EMULATOR_OPENGL := false

# use seperate vendor partition
TARGET_COPY_OUT_VENDOR := vendor

BOARD_GPU_DRIVERS := virgl radeonsi

DEVICE_MANIFEST_FILE := device/redroid/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# ~ 1.3G
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1388314624
