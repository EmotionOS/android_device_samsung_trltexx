# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from common trlte
-include device/samsung/trlte-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := trltexx,trltedt

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 17825792 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 19922944 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3774873600 #910T uses: 3984588800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27019685888 #910T uses: 26558312448

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := apq8084_sec_trlte_eur_defconfig

# Camera
TARGET_FIXUP_PREVIEW := true

#Recovery
TW_THEME := portrait_hdpi

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/trltexx/init/init_trlte.cpp
TARGET_UNIFIED_DEVICE := true

# inherit from the proprietary version
-include vendor/samsung/trltexx/BoardConfigVendor.mk

# Disable dex-preoptimization
WITH_DEXPREOPT := false

  # Custom Toolchain
  TARGET_NDK_VERSION := 5.3
  TARGET_SM_AND := 5.3
  TARGET_SM_KERNEL := 7.0
  DRAGONTC_VERSION := 3.9

  # CMRemix-MM Optimization
  GRAPHITE_OPTIMIZATION := false
  FLOOP_NEST_OPTIMIZE := false
  LOCAL_STRICT_ALIASING := false
  ENABLE_GCC_DEFAULTS := false
  O3_OPTIMIZATIONS := false
  DISABLE_DTC_OPTS := false
  ENABLE_PTHREAD := false
  GCC_ONLY_OPTIMIZATION := false
  ENABLE_DTC_LTO := false
  USE_ARM_MODE := false
  IPA_OPTIMIZATIONS := false
  OPENMP_OPTIMIZATIONS := false
  MEMORY_LEAK_OPTIMIZATIONS := false
  ARCHIDROID_OPTIMIZATIONS := false

# No Optimization Bluetooth modules
LOCAL_BLUETOOTH_BLUEDROID := \
  bluetooth.default \
  libbt-brcm_stack \
  audio.a2dp.default \
  libbt-brcm_gki \
  libbt-utils \
  libbt-qcom_sbc_decoder \
  libbt-brcm_bta \
  bdt \
  bdtest \
  libbt-hci \
  libosi \
  ositests \
  libbt-vendor \
  libbluetooth_jni
  
ifndef NO_OPTIMIZATIONS
  NO_OPTIMIZATIONS := $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
else
  NO_OPTIMIZATIONS += $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
endif

# Dalvik/Art
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sys.fw.dex2oat_thread_count=4

    # DragonTC info
DRAGONTC_VERSION := $(DRAGONTC_VERSION)
export $(DRAGONTC_VERSION)

DTC_PATH := prebuilts/clang/linux-x86/host/$(DRAGONTC_VERSION)/
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)
export $(DTC_VER)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dtc.version=$(DTC_VER)

# Inherite sabermod Config
-include vendor/emotion/config/sm_board.mk
