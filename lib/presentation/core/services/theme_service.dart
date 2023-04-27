import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  bool _isDarkModeOn = false;

  bool get isDarkModeOn {
    return _isDarkModeOn;
  }

  void changeTheme() {
    _isDarkModeOn = !_isDarkModeOn;
    notifyListeners();
  }
}
