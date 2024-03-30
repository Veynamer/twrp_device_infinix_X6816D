#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from X6816D device
$(call inherit-product, device/infinix/X6816D/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X6816D
PRODUCT_NAME := ofox_X6816D
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix HOT 12 Play NFC
PRODUCT_MANUFACTURER := infinix
BUILD_FINGERPRINT := Infinix/X6816D-RU/Infinix-X6816D:11/RP1A.201005.001/221021V7:user/release-keys
