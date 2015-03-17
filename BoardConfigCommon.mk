#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_BOARD_PLATFORM := tegra

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 629145600
BOARD_CACHEIMAGE_PARTITION_SIZE := 1283457024
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29905387520
BOARD_FLASH_BLOCK_SIZE := 4096

# Include an expanded selection of fonts
# TODO: check available system space
# EXTENDED_FONT_FOOTPRINT := true

MALLOC_IMPL := dlmalloc

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
# WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Wi-Fi AP
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR := true

TARGET_KERNEL_SOURCE := kernel/acer/t30
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.7

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_AUDIO_HW := true

BOARD_USES_GENERIC_INVENSENSE := false

-include vendor/acer/t30-common/BoardConfigVendor.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/acer/t30-common/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/acer/t30-common/prebuilt/etc/egl.cfg
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
LEGACY_SURFACE_COMPOSER_CLIENT_SYMBOLS := true
BOARD_USES_LEGACY_SET_POSITION := true

# Acquire signature for WVM
BOARD_USES_LEGACY_ACQUIRE_WVM := true

# Sensors
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# EGL settings
BOARD_HAVE_PIXEL_FORMAT_INFO := true

# Camera
USE_CAMERA_STUB := false

# Samsung EMMC brick bug
# Already disabled in kernel, but disable again for safety
BOARD_SUPPRESS_EMMC_WIPE := true

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.t30

# CMHW
BOARD_HARDWARE_CLASS := device/acer/t30-common/cmhw/

# updater-script
TARGET_RELEASETOOLS_EXTENSIONS := device/acer/t30-common

# Selinux
# FORCE_PERMISSIVE_TO_UNCONFINED := false

# Compat
TARGET_USES_LOGD := false

BOARD_SEPOLICY_DIRS += \
	device/acer/t30-common/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts \
	genfs_contexts \
	app.te \
	bootanim.te \
	device.te \
	drmserver.te \
	file.te \
	lmkd.te \
	mediaserver.te \
	rild.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	ueventd.te
	
# TWRP
DEVICE_RESOLUTION := 1280x800
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_FLASH_FROM_STORAGE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_LARGE_FILESYSTEM := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TARGET_RELEASETOOLS_EXTENSIONS := device/acer/t30-common
BOARD_CUSTOM_BOOTIMG_MK := device/acer/t30-common/custombootimg.mk
TW_BRIGHTNESS_PATH := "/sys/class/backlight/pwm-backlight/brightness"
TARGET_RECOVERY_FSTAB := device/acer/t30-common/prebuilt/ramdisk/fstab.acer
