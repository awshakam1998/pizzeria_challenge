
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.success,
  });

  String id;
  String name;
  String email;
  bool success;
  String photoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "photoUrl": photoUrl == null ? null : photoUrl,
  };
}
