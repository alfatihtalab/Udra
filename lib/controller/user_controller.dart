import 'package:flutter_hosham_app/storage/persistence.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController(this._persistence);

  static const _userStatusKey = "UserStatus";

  bool _isLoggedIn = false;
  final SharedPreferencesPersistence _persistence;
  //Status _userStatus = Status.NotLogin;

  bool get userStatus => _persistence.getBool(_userStatusKey) ?? _isLoggedIn;

  void loggedIn() {
    _isLoggedIn = true;
    _persistence.setBoolKey(_userStatusKey, _isLoggedIn);
  }

  void loggedOut() {
    _isLoggedIn = false;
    _persistence.setBoolKey(_userStatusKey, _isLoggedIn);
  }

  bool test() {
    print('this is ${_persistence.getBool(_userStatusKey)}');

    return _persistence.getBool(_userStatusKey) ?? _isLoggedIn;
  }
}

enum Status { LoggedIn, LoggedOut, NotLogin }
