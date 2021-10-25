import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/model/user.dart';
import 'package:pizzeria_challenge/repository/firebase_repository.dart';
import 'package:pizzeria_challenge/utils/storage.dart';
import 'package:pizzeria_challenge/utils/theme/theme.dart';

class Helper {
  DateTime currentBackPressTime;

  Helper();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar('Exit', "Press again to leave");
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  void loading() {
    Get.defaultDialog(
        backgroundColor: Colors.white70,
        barrierDismissible: false,
        content: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        )),
        title: "wait".tr);
  }

  void error(String title, message) {
    Get.snackbar(
      '',
      "",
      messageText: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.red, fontSize: 25),
      ),
      icon: Icon(
        Icons.error_outline,
        color: Colors.red.shade500,
      ),
    );
  }

  void successMessage(String title, message) {
    Get.snackbar(
      '',
      "",
      messageText: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: AppTheme.primaryColor, fontSize: 25),
      ),
      icon: Icon(
        Icons.done,
        color: AppTheme.primaryColor,
      ),
    );
  }

  Future<User> logout() async {
    LocalStorage localStorage = LocalStorage();
    currentUser.value = new User();
    localStorage.saveUser(User());
    localStorage.erase();
    return await localStorage.getUser();
  }
}
