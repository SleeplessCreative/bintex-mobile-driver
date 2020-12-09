import 'dart:convert';

class Trip {
  String agentOriginId;
  String agentOriginAddress;
  String agentDestinationId;
  String agentDestinationAddress;
  String driverId;

  set setAgentOriginId(String agentOriginId) =>
      this.agentOriginId = agentOriginId;
  set setAgentOriginAddress(String agentOriginAddress) =>
      this.agentOriginAddress = agentOriginAddress;
  set setAgentDestinationId(String agentDestinationId) =>
      this.agentDestinationId = agentDestinationId;
  set setAgentDestinationAddress(String agentDestinationAddress) =>
      this.agentDestinationAddress = agentDestinationAddress;
  set setDriverId(String driverId) => this.driverId = driverId;

  Trip({
    this.agentOriginId,
    this.agentOriginAddress,
    this.agentDestinationId,
    this.agentDestinationAddress,
    this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'agentOriginId': agentOriginId,
      'agentOriginAddress': agentOriginAddress,
      'agentDestinationId': agentDestinationId,
      'agentDestinationAddress': agentDestinationAddress,
      'driverId': driverId,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Trip(
      agentOriginId: map['agentOriginId'],
      agentOriginAddress: map['agentOriginAddress'],
      agentDestinationId: map['agentDestinationId'],
      agentDestinationAddress: map['agentDestinationAddress'],
      driverId: map['driverId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) => Trip.fromMap(json.decode(source));
}
