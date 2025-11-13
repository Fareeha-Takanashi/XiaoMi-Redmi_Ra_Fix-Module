#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

# 確保腳本執行時會寫入日誌
LOGFILE="/data/local/tmp/K40FixRa.log"


# 獲取當前日期時間作為日誌時間戳
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
# 寫入啟動訊息
echo "[${TIMESTAMP}] K40FixRa service.sh starting..." >> $LOGFILE


# 等待設備解鎖 (sys.boot_completed 變為 1)
# 我們需要持續監聽，因為 service.sh 可能在解鎖前運行
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

# 獲取當前日期時間作為日誌時間戳
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[${TIMESTAMP}] K40FixRa: boot_completed..." >> $LOGFILE


# 再等几秒确保 PackageManager 就绪
sleep 8

# 獲取當前日期時間作為日誌時間戳
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[${TIMESTAMP}] K40FixRa: 8S..." >> $LOGFILE


# 執行操作
pm set-home-activity com.miui.home
sleep 1

input keyevent 3
sleep 3

# 獲取當前日期時間作為日誌時間戳
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[${TIMESTAMP}] K40FixRa: OVER..." >> $LOGFILE


#pm set-home-activity com.teslacoilsw.launcher
#sleep 1

#input keyevent 3


exit 0