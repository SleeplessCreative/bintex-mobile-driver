import 'dart:convert';

class Trip {
  String agentOriginId;
  String agentDestinationId;
  String driverId;
  Trip({
    this.agentOriginId,
    this.agentDestinationId,
    this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'agentOriginId': agentOriginId,
      'agentDestinationId': agentDestinationId,
      'driverId': driverId,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Trip(
      agentOriginId: map['agentOriginId'],
      agentDestinationId: map['agentDestinationId'],
      driverId: map['driverId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) => Trip.fromMap(json.decode(source));
}
