class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? token;
  int? points;
  int? credit;

  User({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
    this.points,
    this.credit,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    email = json["email"]?.toString();
    phone = json["phone"]?.toString();
    image = json["image"]?.toString();
    points = json["points"]?.toInt();
    credit = json["credit"]?.toInt();
    token = json["token"]?.toString();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'id': id,
        'image': image,
        'token': token
      };
}
