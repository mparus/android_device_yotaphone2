#
# Copyright 2014 The Android Open-Source Project
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
#

# Use the non-open-source parts, if they're present
-include vendor/yota/yotaphone2/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm8974
TARGET_NO_BOOTLOADER := true

BOARD_EGL_CFG := device/yota/yotaphone2/egl.cfg

# BOOT.IMG and Kernel parameters
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_BASE := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.selinux=permissive androidboot.bootdevice=msm_sdcc.1

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x00000100 --dt device/yota/yotaphone2/dt.img
# TODO: for CM version add --dt $(LOCAL_PATH)/dt.img

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27375697920
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true.

# Recovery
TARGET_RECOVERY_FSTAB := device/yota/yotaphone2/recovery.fstab

# For inline kernel building
# BUILD_KERNEL := true
# needs mod in build tools too: e.g. add build/core/tasks/kernel.mk
TARGET_KERNEL_SOURCE := kernel/yota/yotaphone2
# KERNEL_DEFCONFIG := msm8974_defconfig
TARGET_KERNEL_CONFIG := yotaphone2_defconfig
# KERNEL_TARGET := zImage
# TARGET_KERNEL_CONFIG := msm8974_defconfig
# needed?
# KERNEL_DIR := kernel
#-include $(TOP)/$(KERNEL_DIR)/AndroidKernel.mk

# use prebuilt kernel for now
# TARGET_PREBUILT_KERNEL := device/yota/yotaphone2/kernel/zImage

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_EXTERNAL_SPEAKER := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Display
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/motorola/victara/sepolicy
# Fonts
EXTENDED_FONT_FOOTPRINT := true

TARGET_POWERHAL_VARIANT := qcom

BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
BOARD_USES_OPENSSL_SYMBOLS := true


# OpenGL
USE_OPENGL_RENDERER := true
# Storage

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_REAL_SDCARD := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Misc
BOARD_HAS_NO_SELECT_BUTTON := true

# Encryption
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_HW_DISK_ENCRYPTION := true


# TWRP
TW_THEME := portrait_hdpi
TW_NO_USB_STORAGE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
RECOVERY_SDCARD_ON_DATA := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_EXFAT_FUSE := true # Enabled as kernel driver instead

