#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread


# 等待設備開機，sys.boot_completed 變為 1
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

# 再等几秒确保 PackageManager 就绪
sleep 7

# 執行操作
pm set-home-activity com.miui.home
sleep 1

input keyevent 3
sleep 3

pm set-home-activity com.teslacoilsw.launcher
sleep 1

input keyevent 3


exit 0