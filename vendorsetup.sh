FDEVICE="X6816D"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TW_DEFAULT_LANGUAGE="ru"
    export OF_DEVICE_ALT="X6816D"
	export LC_ALL="C"
	export OF_AB_DEVICE=1
	export FOX_EXTREME_SIZE_REDUCTION=1
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_QUICK_BACKUP_LIST="/data;"
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export FOX_DELETE_AROMAFM=1
	export OF_USE_GREEN_LED=0
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
        export FOX_USE_XZ_UTILS=1
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
        export FOX_ENABLE_APP_MANAGER=1
 
	# OTA
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# encryption
	export OF_DISABLE_FORCED_ENCRYPTION=1
	export OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION=1
	
	# screen settings
	export OF_SCREEN_H=2400
	export OF_STATUS_H=80
	export OF_CLOCK_POS=2
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
        export OF_HIDE_NOTCH=1
	# Bootimage Partition path
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	# flashlight
	export OF_FLASHLIGHT_ENABLE=1
        export OF_FL_PATH1="/sys/devices/virtual/torch/torch/torch_level"
    
	# R11
	export FOX_VERSION="R11.1_1"
	export FOX_VARIANT=Stable
	export OF_PATCH_AVB20=1
	export OF_MAINTAINER="Veynamer"

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=1

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi

fi
#
