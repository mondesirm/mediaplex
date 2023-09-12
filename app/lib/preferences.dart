import 'package:shared_preferences/shared_preferences.dart';

import 'theme/app_theme.dart';

class ThemePreference {
  static const themeKey = 'theme_key';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    AppDynamicColorBuilder.isDarkMode = value;
    sharedPreferences.setBool(themeKey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    AppDynamicColorBuilder.isDarkMode = sharedPreferences.getBool(themeKey) ?? false;
    return sharedPreferences.getBool(themeKey) ?? false;
  }
}