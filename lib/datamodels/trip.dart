import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trip {
  String agentOriginId;
  String agentOriginAddress;
  LatLng agentOriginLatLng;

  String agentDestinationId;
  String agentDestinationAddress;
  LatLng agentDestinationLatLng;

  String driverId;

  set setAgentOriginId(String agentOriginId) =>
      this.agentOriginId = agentOriginId;
  set setAgentOriginAddress(String agentOriginAddress) =>
      this.agentOriginAddress = agentOriginAddress;
  set setAgentOriginLatLng(LatLng agentOriginLatLng) =>
      this.agentOriginLatLng = agentOriginLatLng;

  set setAgentDestinationId(String agentDestinationId) =>
      this.agentDestinationId = agentDestinationId;
  set setAgentDestinationAddress(String agentDestinationAddress) =>
      this.agentDestinationAddress = agentDestinationAddress;
  set setAgentDestinationLatLng(LatLng agentDestinationLatLng) =>
      this.agentDestinationLatLng = agentDestinationLatLng;

  set setDriverId(String driverId) => this.driverId = driverId;

  Trip({
    this.agentOriginId,
    this.agentOriginAddress,
    this.agentOriginLatLng,
    this.agentDestinationId,
    this.agentDestinationAddress,
    this.agentDestinationLatLng,
    this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'agentOriginId': agentOriginId,
      'agentOriginAddress': agentOriginAddress,
      'agentOriginLatLng': agentOriginLatLng,
      'agentDestinationId': agentDestinationId,
      'agentDestinationAddress': agentDestinationAddress,
      'agentDestinationLatLng': agentDestinationLatLng,
      'driverId': driverId,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Trip(
      agentOriginId: map['agentOriginId'],
      agentOriginAddress: map['agentOriginAddress'],
      agentOriginLatLng: map['agentOriginLatLng'],
      agentDestinationId: map['agentDestinationId'],
      agentDestinationAddress: map['agentDestinationAddress'],
      agentDestinationLatLng: map['agentDestinationLatLng'],
      driverId: map['driverId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) => Trip.fromMap(json.decode(source));
}
