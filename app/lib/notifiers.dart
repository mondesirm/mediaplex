import 'package:flutter/material.dart';

import 'preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = true;
  final ThemePreference _preferences = ThemePreference();

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}