import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = false;

  late SharedPreferences preferences;

  ThemeController({required this.preferences});

  get getTheme {
    _isDark = preferences.getBool("Theme") ?? false;
    return _isDark;
  }

  void changeTheme() {
    _isDark = !_isDark;
    preferences.setBool("Theme", true);
    notifyListeners();
  }
}
