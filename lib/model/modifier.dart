import 'package:pizzeria_challenge/model/modifier_child.dart';

class Modifier {
  Modifier({
    this.name,
    this.isRequired,
    this.select,
    this.children,
  });

  String name;
  String isRequired;
  String select;
  List<ModifierChild> children;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
    name: json["name"] == null ? null : json["name"],
    isRequired: json["isRequierd"] == null ? null : json["isRequierd"],
    select: json["select"] == null ? null : json["select"],
    children: json["ModifierChild"] == null ? null : List<ModifierChild>.from(json["ModifierChild"].map((x) => ModifierChild.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "isRequierd": isRequired == null ? null : isRequired,
    "select": select == null ? null : select,
    "ModifierChild": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
  };
}
