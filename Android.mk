#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# SPRD-Device
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),X6816D)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
