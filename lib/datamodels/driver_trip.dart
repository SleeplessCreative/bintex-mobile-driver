import 'dart:convert';

class History {
  String districtOrigin;
  String agentOrigin;
  String districtDestination;
  String agentDestination;

  History({
    this.districtOrigin,
    this.agentOrigin,
    this.districtDestination,
    this.agentDestination,
  });

  Map<String, dynamic> toMap() {
    return {
      'districtOrigin': districtOrigin,
      'agentOrigin': agentOrigin,
      'districtDestination': districtDestination,
      'agentDestination': agentDestination,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return History(
      districtOrigin: map['origin_district'],
      agentOrigin: map['origin_id'],
      districtDestination: map['destination_district'],
      agentDestination: map['destination_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source));
}
