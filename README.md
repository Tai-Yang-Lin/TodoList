# grltest_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Flutter SDK開發版本
Flutter 3.17.0-4.0.pre • channel master • https://github.com/flutter/flutter.git
Framework • revision ca384b84e5 (4 months ago) • 2023-11-08 06:14:09 +0100
Engine • revision 3e3be5e33b
Tools • Dart 3.3.0 (build 3.3.0-102.0.dev) • DevTools 2.30.0-dev.1


2024.03.04更新日誌
尚未完成
1.狀態管理導入
    未完成原因：因近期本人面試眾多，沒抓好時程，本來想說這種簡單的小project應該可以不用狀態管理套件，結果才發現好像會有點小bug

目前bug：
1.進度數字 & 進度條在已經有代辦事項的狀態下新增+刪除時會不準確
2.滾動條與清除icon鈕間距太近不好按

bug解法：
1.導入狀態管理套件ex.BLoC、Provider、RiverPod
2.新增void addList(){} & 刪除checkList.remove(checkList[i]);這兩邊 要把percentInt加進去，但要在改寫一下以免出現負數
3.滾動條與icon重新調整大小避免溢位並加個padding || margin
