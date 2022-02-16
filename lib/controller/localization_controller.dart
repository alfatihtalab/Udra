import 'package:flutter_hosham_app/storage/persistence.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  LocalizationController(this._persistence);

  String _currentLocalization = 'en';
  final SharedPreferencesPersistence _persistence;

  //get current localization
  String get currentLocalization => _currentLocalization;

  //set localization
}
