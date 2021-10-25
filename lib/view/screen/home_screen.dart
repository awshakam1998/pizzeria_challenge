import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_challenge/model/modifier.dart';
import 'package:pizzeria_challenge/model/product.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/utils/theme/theme.dart';
import 'package:pizzeria_challenge/view/screen/add_product_screen.dart';
import 'package:pizzeria_challenge/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('homeScreen'.tr),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            StreamBuilder(
                stream:
                    FirebaseDatabase.instance.reference().child('menu').onValue,
                builder: (context, snapshot) {
                  DataSnapshot snapshot1 ;
                  Map products = {};
                  if (snapshot != null) {
                    snapshot1 = snapshot?.data?.snapshot;
                    products = productFromJson(
                        json.encode(Map.from(snapshot1?.value??{})));
                  }
                  return snapshot?.data?.snapshot?.value == null
                      ? SizedBox()
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              Product p = products.values.toList()[index];
                              return Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            '${p.img}',
                                            height: 100,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${p.title}',
                                                style: AppTheme.primaryText(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Text(
                                                '${p.description}',
                                                style: AppTheme.descriptionText(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: _buildList(p.modifiers),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      );
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(AddProductScreen());
                  },
                  child: Container(
                    color: AppTheme.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'addProduct'.tr,
                        style: AppTheme.accentText(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildList(List<Modifier> modifiers) {
    List<Widget> widgets = [];
    for (var value in modifiers) {
      String childrenModifiers = '';
      value.children.forEach((element) {
        childrenModifiers += element.name + ' / ';
      });
      widgets.add(
        Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
              color: AppTheme.accentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Text(
                  '${value.name}',
                  style: AppTheme.descriptionText(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Text(
                  '${childrenModifiers.substring(0, childrenModifiers.length - 2)}',
                  style: AppTheme.descriptionText(),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return widgets;
  }
}
