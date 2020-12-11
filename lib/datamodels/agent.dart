import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Agent {
  int agentId;
  String district;
  String address;
  LatLng latLng;
  String get getAddress => address;

  Agent({
    this.agentId,
    this.district,
    this.latLng,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'agent_id': agentId,
      'district': district,
      'latLng': latLng,
      'address': address,
    };
  }

  factory Agent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Agent(
      agentId: map['agent_id'],
      district: map['district'],
      latLng: map['latLng'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Agent.fromJson(String source) => Agent.fromMap(json.decode(source));
}
