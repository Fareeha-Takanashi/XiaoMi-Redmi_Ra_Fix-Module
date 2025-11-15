#!/system/bin/sh
# 這個sh是要按下按鈕以後動作，儲存現在設定的啟動器
MODDIR=${0%/*}

# 存儲的檔案位置
SaveFILE="$MODDIR/K40FixRa.save"

# 取得原來設定的
RowLauncher=$(cmd package resolve-activity -c android.intent.category.HOME -a android.intent.action.MAIN | grep 'packageName=' | head -n 1 | awk -F'=' '{print $2}')

echo "取得原啟動器："
echo $RowLauncher

# 寫入啟動訊息
echo $RowLauncher > $SaveFILE

echo "已經儲存到："
echo $SaveFILE

exit 0