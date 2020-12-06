import 'dart:convert';

class Agent {
  int agentId;
  String district;
  String address;
  String get getAddress => address;

  Agent({
    this.agentId,
    this.district,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'agent_id': agentId,
      'district': district,
      'address': address,
    };
  }

  factory Agent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Agent(
      agentId: map['agent_id'],
      district: map['district'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Agent.fromJson(String source) => Agent.fromMap(json.decode(source));
}
