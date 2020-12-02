import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

import '../datamodels/user.dart';

@lazySingleton
class ApiService {
  final String baseUrl = "https://staging.bintex.id";
  Client client = Client();

  Future<bool> login(User data) async {
    final response = await client.post(
      "$baseUrl/api/auth/login",
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );
    if (response.statusCode == 202) {
      return true;
    } else {
      return false;
    }
  }
}
