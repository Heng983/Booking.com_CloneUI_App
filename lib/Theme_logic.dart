import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changetoSystemode() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changetoLightmode() {
    _themeIndex = 1;
    notifyListeners();
  }

  void changetoDarkmode() {
    _themeIndex = 2;
    notifyListeners();
  }
}
