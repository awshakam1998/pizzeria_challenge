import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pizzeria_challenge/model/modifier.dart';
import 'package:pizzeria_challenge/model/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pizzeria_challenge/model/product.dart';
import 'package:pizzeria_challenge/utils/helper.dart';

ValueNotifier<User> currentUser = ValueNotifier(User());

Future<User> googleSignIn() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    User googleUser = User();
    googleUser.email = googleSignInAccount.email;
    googleUser.name = googleSignInAccount.displayName ?? "";
    googleUser.id = googleSignInAccount.id;
    googleUser.photoUrl = googleSignInAccount.photoUrl ?? "";
    print(googleUser.toJson());
    googleUser.success = true;
    return googleUser;
  } else
    return User(success: false);
}

Future<String> uploadPic(String productName, String productDescription,
    List<Modifier> modifiersList,File image) async {
  Helper().loading();
  FirebaseStorage storage = FirebaseStorage.instance;
  String url;
  Reference ref =
      storage.ref().child('images').child("img_" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(image);
  uploadTask.whenComplete(() async {
    url = await ref.getDownloadURL();
    Product product = Product(
        title: '$productName',
        description: '$productDescription',
        img: '$url',
        modifiers: modifiersList);
    saveToFirebase(product);
  }).catchError((onError) {
    print(onError);
    Get.back();
  });

  return url;
}

saveToFirebase(Product product) {
  FirebaseDatabase.instance
      .reference()
      .child('menu')
      .push()
      .set(Map<String, Object>.from(product.toJson()))
      .then((value) {
    Get.back();
    Get.back();
  });
}
