import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

import '../datamodels/api_message.dart';
import '../datamodels/trip.dart';
import '../datamodels/user.dart';

@lazySingleton
class ApiService {
  final String baseUrl = "https://staging.bintex.id";
  Client client = Client();

  Future<String> login(User data) async {
    final response = await client.post(
      "$baseUrl/api/auth/login",
      headers: {"content-type": "application/json"},
      body: data.toJson(),
    );

    if (response.statusCode == 202) {
      return "Logged in.";
    } else {
      return ApiMessage.fromJson(response.body).message;
    }
  }

  Future<String> addTrip(Trip data) async {
    final response = await client.post(
      "$baseUrl/api/driver/deliver",
      headers: {"content-type": "application/json"},
      body: data.toJson(),
    );
    return response.body;
  }

  Future<List<dynamic>> getAgentList() async {
    final response = await client.get("$baseUrl/api/agent/get-agent");
    var data = json.decode(response.body).toList();
    return data;
  }

  Future<List<dynamic>> getTripHistory(String driverId) async {
    Map<String, String> param = {"driverId": driverId};

    final response = await client.post(
      "$baseUrl/api/driver/get-driver-histories",
      headers: {"content-type": "application/json"},
      body: json.encode(param),
    );
    var data = json.decode(response.body).toList();
    return data;
  }
}
