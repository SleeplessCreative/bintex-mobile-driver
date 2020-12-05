import 'dart:convert';

class DriverTripHistory {
  String districtOrigin;
  String agentOrigin;
  String districtDestination;
  String agentDestination;

  DriverTripHistory({
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

  factory DriverTripHistory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DriverTripHistory(
      districtOrigin: map['districtOrigin'],
      agentOrigin: map['agentOrigin'],
      districtDestination: map['districtDestination'],
      agentDestination: map['agentDestination'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverTripHistory.fromJson(String source) =>
      DriverTripHistory.fromMap(json.decode(source));
}

class Histories {
  List<DriverTripHistory> histories;

  Histories({
    this.histories,
  });

  Map<String, dynamic> toMap() {
    return {
      'histories': histories?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Histories.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Histories(
      histories: List<DriverTripHistory>.from(
          map['histories']?.map((x) => DriverTripHistory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Histories.fromJson(String source) =>
      Histories.fromMap(json.decode(source));
}
