include device/generic/arm64/BoardConfig.mk

TARGET_USES_HWC2 := true

# want all fonts
SMALLER_FONT_FOOTPRINT := false
MINIMAL_FONT_FOOTPRINT := false

BUILD_EMULATOR_OPENGL := false

# use seperate vendor partition
TARGET_COPY_OUT_VENDOR := vendor

# TODO add panfrost
BOARD_GPU_DRIVERS := freedreno lima virgl radeonsi

DEVICE_MANIFEST_FILE := device/redroid/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# ~ 1.3G
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1388314624
