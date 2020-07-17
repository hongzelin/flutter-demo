import 'package:flutter/material.dart';

// 1 创建 Provider，需要继承 ChangeNotifier
class MyChangeNotifier with ChangeNotifier {
  int _count = 111; // 状态

  int get count => _count; // 获取状态

  // 更新状态
  incCount() {
    this._count++;
    notifyListeners(); // 通知状态更新
  }
}
