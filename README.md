# 紅米K40多任務卡死修復
Fix Redmi K40 Long press in <recent apps> stuck
本模塊用於修復：
- 不用小米的Launcher導致最近任務界面RecentsActivity長按應用會卡死的神奇BUG

## 基本思路
- RecentsActivity和小米的Launcher是同個包名（com.miui.home），小米的Launcher沒有被設定默認的話，開機就不啟動。。。
- 小米的Launcher甚至不能被快捷方式直接打開...？
- 透過解鎖以後設定默認再改回來，基本解決了這個問題

## 其他
- 製作基於topjohnwu的Magisk模板
- 作用在EU版HyperOS 1.0.10.0的Redmi K40，其他裝置/版本不知道能不能用，僅作分享參考

