import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hosham_app/storage/persistence.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  LocalizationController(this._persistence);

  String _currentLocalization = 'en';
  final SharedPreferencesPersistence _persistence;

  //get current localization
  String get currentLocalization => _currentLocalization;

  //set localization
  void changeLocal( BuildContext context){
    context.setLocale(const Locale("ar"));
  }
}
