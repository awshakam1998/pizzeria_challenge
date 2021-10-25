import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_challenge/model/modifier.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pizzeria_challenge/repository/firebase_repository.dart';
import 'package:pizzeria_challenge/utils/helper.dart';

class AddProductViewModel extends GetxController {
  File image;
  String productName = '';
  String productDescription = '';
  List<Modifier> modifiersList = [];
  final formKey = GlobalKey<FormState>();
  FirebaseStorage _storage = FirebaseStorage.instance;
  final picker = ImagePicker();

  @override
  void onInit() {
    _storagePermission();
  }

  Future pickImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
    Get.back();
  }

  uploadImage() {
    showDialog(
        context: Get.context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              content: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'chooseImgFrom'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_camera,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "camera".tr,
                          )
                        ],
                      ),
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(
                            Icons.image,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "gallery".tr,
                          )
                        ],
                      ),
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  _storagePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
      Permission.storage,
    ].request();
  }

  saveProduct() {
    formKey.currentState.save();
    if (formKey.currentState.validate()) {
      if (modifiersList.isEmpty) {
        Helper().error('error'.tr, 'noModifier'.tr);
      } else if (image == null) {
        Helper().error('error'.tr, 'onImage'.tr);
      } else {
        bool pass = true;
        modifiersList.forEach((element) {
          if (GetUtils.isNullOrBlank(element.select) ||
              GetUtils.isNullOrBlank(element.isRequired)) pass = false;
        });
        if (pass) {
          save();
        } else
          Helper().error('error'.tr, 'mustCompete'.tr);
      }
    }
  }

  save() async {
    await uploadPic(productName, productDescription, modifiersList, image);
  }
}
