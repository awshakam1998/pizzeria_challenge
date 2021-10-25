import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pizzeria_challenge/model/user.dart';
import 'package:pizzeria_challenge/repository/firebase_repository.dart';
import 'package:pizzeria_challenge/utils/helper.dart';
import 'package:pizzeria_challenge/utils/storage.dart';
import 'package:pizzeria_challenge/view/screen/home_screen.dart';

class LoginViewModel extends GetxController {
  bool isLoading = false;
  LocalStorage storage = LocalStorage();
  bool isAdmin=true;

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  getUser() async {
    currentUser.value = await storage.getUser();
    update();
  }

  login() {
    Helper().loading();
    googleSignIn().then((value) {
      currentUser.value = value;
      Get.back();
      Get.offAll(HomeScreen());
      update();
    });
  }
}
