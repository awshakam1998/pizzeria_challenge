class ModifierChild {
  ModifierChild({
    this.name,
    this.price,
  });

  String name;
  double price;

  factory ModifierChild.fromJson(Map<String, dynamic> json) => ModifierChild(
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "price": price == null ? null : price,
  };
}
