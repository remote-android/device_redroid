# arm64 emulator specific definitions
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a

include build/make/target/board/BoardConfigGsiCommon.mk

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 16777216

BOARD_MESA3D_USES_MESON_BUILD := true
BOARD_MESA3D_GALLIUM_DRIVERS := virgl radeonsi v3d vc4 freedreno panfrost
BOARD_MESA3D_VULKAN_DRIVERS := virtio-experimental amd broadcom freedreno panfrost

DEVICE_MANIFEST_FILE += device/redroid/manifest.xml

