import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/storage/persistence.dart';
import 'package:flutter_hosham_app/theme_app.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeController(this._persistence);
  final SharedPreferencesPersistence _persistence;

  late ThemeData _theme;
  late bool? _isToggled;

  String _isDarkKey = "isDark";
  String _isToggledKey = "isToggled";

  //getter current theme mode
  // ignore: unnecessary_getters_setters
  ThemeData get theme => _theme;

  bool get isToggled => _isToggled ?? false;

  //setter current theme mode
  set theme(ThemeData mode) => _theme = mode;
  set isToggled(bool b) => _isToggled = b;

  Future<void> setDark(bool isDark) async {
    isDark ? _theme = DemoTheme.dark() : _theme = DemoTheme.light();
    _persistence.setBoolKey(_isDarkKey, isDark);
    _persistence.setBoolKey(_isToggledKey, isDark);
  }

  void getToggeldValue() {
    _isToggled = _persistence.getBool(_isToggledKey) ?? false;
  }

  void getCurrentTheme() {
    bool? isDark = _persistence.getBool(_isDarkKey);

    if (isDark == true) {
      _theme = DemoTheme.dark();
    } else {
      _theme = DemoTheme.light();
    }
  }
}
