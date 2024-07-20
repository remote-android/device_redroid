include build/make/target/board/generic_x86_64_ab/BoardConfig.mk

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

DEVICE_MANIFEST_FILE += device/redroid/manifest.xml

# Increase the system image partition size to 2 GB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
