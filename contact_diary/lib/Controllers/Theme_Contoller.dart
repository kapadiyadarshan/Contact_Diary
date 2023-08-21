import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = false;

  get getTheme {
    return _isDark;
  }

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
