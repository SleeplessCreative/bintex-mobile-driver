import 'package:bintex_mobile_driver/datamodels/api_message.dart';
import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

import '../datamodels/user.dart';

@lazySingleton
class ApiService {
  final String baseUrl = "https://staging.bintex.id";
  Client client = Client();

  Future<String> login(User data) async {
    final response = await client.post(
      "$baseUrl/api/auth/login",
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );

    if (response.statusCode == 202) {
      return "Logged in.";
    } else {
      return ApiMessage.fromJson(response.body).message;
    }
  }
}
