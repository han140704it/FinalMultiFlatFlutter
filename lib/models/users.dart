class User {
  late final int id;
  late final String name;
  late final String email;
  late final String password;
  late final String imageUrl;
  User({required this.id, required this.name,required this.password, required this.email, required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      name : json['name'],
      email : json['email'],
      password: json['passwork'],
      imageUrl : json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.imageUrl;
    return data;
  }
}
