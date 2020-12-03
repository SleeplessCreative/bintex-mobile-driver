import 'dart:convert';

class ApiMessage {
  String message;
  ApiMessage({
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory ApiMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiMessage(
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiMessage.fromJson(String source) =>
      ApiMessage.fromMap(json.decode(source));
}
