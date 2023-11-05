import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', appLanguage);
  }

  void changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.setString('themeMode', appTheme==ThemeMode.light ? 'light' : 'dark');
    prefs.setBool('isDark', appTheme == ThemeMode.dark);
  }
}