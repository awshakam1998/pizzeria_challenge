import 'dart:convert';

import 'package:pizzeria_challenge/model/modifier.dart';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  Product({
    this.title,
    this.description,
    this.img,
    this.modifiers,
  });

  String title;
  String description;
  String img;
  List<Modifier> modifiers;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    img: json["img"] == null ? null : json["img"],
    modifiers: json["modifiers"] == null ? null : List<Modifier>.from(json["modifiers"].map((x) => Modifier.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "img": img == null ? null : img,
    "modifiers": modifiers == null ? null : List<dynamic>.from(modifiers.map((x) => x.toJson())),
  };
}
