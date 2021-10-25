import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/model/modifier.dart';
import 'package:pizzeria_challenge/model/modifier_child.dart';
import 'package:pizzeria_challenge/utils/helper.dart';
import 'package:pizzeria_challenge/utils/theme/theme.dart';
import 'package:pizzeria_challenge/viewmodel/add_product_viewmodel.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('addProductScreen'.tr),
        centerTitle: true,
      ),
      body: GetBuilder<AddProductViewModel>(
        init: AddProductViewModel(),
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:Form(
              key: controller.formKey,
              child:  Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.image == null)
                          controller.uploadImage();
                        else {
                          controller.image = null;
                          controller.update();
                        }
                      },
                      child: Container(
                        color: Colors.grey.shade300,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: controller.image != null
                            ? Stack(
                          children: [
                            Image.file(
                              controller.image,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 75,
                              ),
                            ),
                          ],
                        )
                            : Icon(
                          Icons.add_photo_alternate,
                          size: 75,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      controller.productDescription=value;
                      controller.update();
                    },
                    validator: (value) {
                      if(value.isEmpty)
                        return 'required'.tr;
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'title'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      controller.productName=value;
                      controller.update();
                    },
                    validator: (value) {
                      if(value.isEmpty)
                        return 'required'.tr;
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'description'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'modifiers'.tr,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.modifiersList.length,
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'CategoryName'.tr,
                                ),
                                validator: (value) {
                                  if(value.isEmpty)
                                    return 'required'.tr;
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.modifiersList[index].name =
                                      value;
                                  controller.update();
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text('isRequired'.tr),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          onChanged: (value) {
                                            controller.modifiersList[index]
                                                .isRequired = 'required'.tr;
                                            controller.update();
                                          },
                                          value: 'required'.tr,
                                          groupValue: controller
                                              .modifiersList[index]
                                              .isRequired,
                                        ),
                                        Text('required'.tr),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          onChanged: (value) {
                                            controller.modifiersList[index]
                                                .isRequired = 'optional'.tr;
                                            controller.update();
                                          },
                                          value: controller
                                              .modifiersList[index]
                                              .isRequired,
                                          groupValue: 'optional'.tr,
                                        ),
                                        Text('optional'.tr),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('select'.tr),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          onChanged: (value) {
                                            controller.modifiersList[index]
                                                .select = 'one'.tr;
                                            controller.update();
                                          },
                                          value: 'one'.tr,
                                          groupValue: controller
                                              .modifiersList[index].select,
                                        ),
                                        Text('one'.tr),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          onChanged: (value) {
                                            controller.modifiersList[index]
                                                .select = 'many'.tr;
                                            controller.update();
                                          },
                                          value: controller
                                              .modifiersList[index].select,
                                          groupValue: 'many'.tr,
                                        ),
                                        Text('many'.tr),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .modifiersList[index].children.length,
                                itemBuilder: (context, indexChild) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            validator: (value) {
                                              if(value.isEmpty)
                                                return 'required'.tr;
                                              return null;
                                            },
                                            onChanged: (value) {
                                              controller
                                                  .modifiersList[index]
                                                  .children[indexChild]
                                                  .name = value;
                                              controller.update();
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'name'.tr,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            validator: (value) {
                                              if(value.isEmpty)
                                                return 'required'.tr;
                                              return null;
                                            },
                                            keyboardType:
                                            TextInputType.number,
                                            onChanged: (value) {
                                              controller
                                                  .modifiersList[index]
                                                  .children[indexChild]
                                                  .price =
                                                  double.parse(value);
                                              controller.update();
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'price'.tr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.modifiersList[index].children
                                      .add(ModifierChild());
                                  controller.update();
                                },
                                child: Container(
                                  color: Colors.grey.shade200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('addChild'.tr)
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.modifiersList.add(Modifier(children: []));
                              controller.update();
                            },
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('addModifier'.tr)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.saveProduct();
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: AppTheme.primaryColor,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'saveProduct'.tr,
                                    style: AppTheme.accentText(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
