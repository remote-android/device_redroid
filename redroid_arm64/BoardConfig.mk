include build/make/target/board/generic_arm64_ab/BoardConfig.mk

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

DEVICE_MANIFEST_FILE += device/redroid/manifest.xml

