#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/infinix/X6816D

PRODUCT_PLATFORM := ums512

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service \
    libhealthd.$(PRODUCT_PLATFORM)

# Boot Control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES += \
    bootctrl.unisoc \
    bootctrl.unisoc.recovery

# --- Decryption (doesn't work!)
PRODUCT_PROPERTY_OVERRIDES += \
   	ro.crypto.dm_default_key.options_format.version=2 \
   	ro.crypto.volume.filenames_mode=aes-256-cts \
   	ro.crypto.volume.metadata.method=dm-default-key \
   	ro.crypto.volume.options=::v2 \
   	ro.crypto.uses_fs_ioc_add_encryption_key=true

# Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

#vibro
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.vibrator-V1-cpp.so \
    android.hardware.vibrator@1.0.so \
    android.hardware.vibrator@1.1.so \
    android.hardware.vibrator@1.2.so \
    android.hardware.vibrator@1.3.so 

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V1-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.3.so
# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/infinix
