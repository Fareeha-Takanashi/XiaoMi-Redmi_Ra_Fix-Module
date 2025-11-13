#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread


# 等設備開機，sys.boot_completed 變為 1
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done


# 監看events日誌緩衝區的標記
# "grep -m 1"表示在找到第一個匹配項後立即退出
# "uc_unlock_user"如果提前出/不出，可以找找别的
logcat -b events | grep -m 1 "uc_unlock_user"


# 再等下，給PackageManager點時間
sleep 2

# 執行操作
pm set-home-activity com.miui.home
sleep 1

input keyevent 3
sleep 2

# 不用NOVA的話，"com.teslacoilsw.launcher"換成你的launcher包名
pm set-home-activity com.teslacoilsw.launcher
sleep 1

input keyevent 3



exit 0