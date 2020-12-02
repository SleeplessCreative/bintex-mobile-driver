import 'dart:convert';

class User {
  String email;
  String password;

  User({this.email, this.password});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      email: map["email"],
      password: map["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  @override
  String toString() {
    return 'Profile{email: $email, password: $password}';
  }
}

List<User> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJson(item)));
}

String userToJson(User data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
