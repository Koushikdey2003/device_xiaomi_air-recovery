#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/air

# Compressed Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# API
BOARD_SHIPPING_API_LEVEL := 32
PRODUCT_TARGET_VNDK_VERSION := 33

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# EROFS tools
PRODUCT_PACKAGES += \
    fsck.erofs.recovery \
    mkfs.erofs.recovery \
    dump.erofs.recovery

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example_recovery

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/miui_releasekey

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
