import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_hosham_app/controller/user_controller.dart';
import 'package:flutter_hosham_app/main.dart';
import 'package:flutter_hosham_app/models/user.dart';

class ApiServices {
  UserController userControl = UserController(persistence);
  Future<Status> checkStorage() async {
    if (userControl.userStatus) {
      return Status.LoggedIn;
    } else {
      return Status.NotLogin;
    }
  }

  // Batch request that gets both today recipes and friend's feed
  Future<Status> checkUser(String username, String password) async {
    var users = await _getUsers();
    print(users);
    for (var user in users) {
      if (user.username == username && user.password == password) {
        //print('not found');
        userControl.loggedIn();
        return Status.LoggedIn;
      }
    }
    userControl.loggedOut();
    return Status.LoggedOut;
  }

  // Get sample users json
  Future<List<User>> _getUsers() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/team_sample_data.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to ExploreRecipe object.
    if (json['users'] != null) {
      final users = <User>[];
      json['users'].forEach((v) {
        users.add(User.fromJson(v));
      });
      return users;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    //NetworkAssetBundle()
    return rootBundle.loadString(path);
  }
}
