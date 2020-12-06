import '../../../app/locator.dart';
import '../../../datamodels/agent.dart';
import '../../../datamodels/trip.dart';
import '../../../services/api_service.dart';
import 'package:stacked/stacked.dart';

class AddViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();

  void addTrip() async {
    Trip data = new Trip(
      agentOriginId: _agentOriginId,
      agentDestinationId: _agentDestinationId,
      driverId: _driverId,
    );
    await _apiService.addTrip(data);
  }

  Future getAgentList() async {
    var result = await _apiService.getAgentList();

    List<Agent> data = List<Agent>();
    result.forEach((element) {
      data.add(new Agent.fromMap(element));
    });

    _agentList = data;
  }

  Future<List> getSuggestions(String query) async {
    await getAgentList();
    List suggestions = new List();
    if (query.isNotEmpty && query != null) {
      suggestions.addAll(_agentList);
      suggestions.retainWhere(
          (s) => s.address.toLowerCase().contains(query.toLowerCase()));
    }
    return suggestions;
  }

  List<Agent> _agentList;
  List<Agent> get agentList => _agentList;

  // List get agentList => _agentList;

  // set agentList(List value) => _agentList = value;

  String _agentOriginId;
  void agentOriginId(String value) {
    _agentOriginId = value;
  }

  String _agentDestinationId;
  void agentDestinationId(String value) {
    _agentDestinationId = value;
  }

  String _driverId;
  void driverId(String value) {
    _driverId = value;
  }

  String _setLabel = 'Add your trip details';
  String get setLabel => _setLabel;

  String _originLabel = 'Origin';
  String get originLabel => _originLabel;

  String _destinationLabel = 'Destination';
  String get destinationLabel => _destinationLabel;

  String _goButtonLabel = 'Go';
  String get goButtonLabel => _goButtonLabel;
}
