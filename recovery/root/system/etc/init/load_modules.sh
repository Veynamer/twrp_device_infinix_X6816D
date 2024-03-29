#!/system/etc/init/sh

# By Veynamer vibro Fix
load_panel()
{
	insmod /vendor/lib/modules/sc27xx-vibra.ko
}


load_panel
wait 1
setprop modules.loaded 1
exit 0