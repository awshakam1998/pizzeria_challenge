import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (controller) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  InkWell(
                    onTap: () {
                      controller.login();
                    },
                    child: Container(
                      color: Color(0xffeeeeee),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/google.png',
                              height: 25,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('googleLogin'.tr),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
