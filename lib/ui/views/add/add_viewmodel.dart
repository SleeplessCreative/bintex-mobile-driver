import '../trip/trip_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../datamodels/agent.dart';
import '../../../datamodels/trip.dart';
import '../../../services/api_service.dart';

class AddViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToTrip() async {
    await _navigationService.navigateWithTransition(
      TripView(trip: _trip),
      transition: NavigationTransition.RightToLeft,
      duration: Duration(milliseconds: 300),
    );
  }

  Future addTrip() async {
    await _apiService.addTrip(_trip);
    return navigateToTrip();
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

  Trip _trip = Trip();
  Trip get trip => _trip;

  String _setLabel = 'Add your trip details';
  String get setLabel => _setLabel;

  String _originLabel = 'Origin';
  String get originLabel => _originLabel;

  String _destinationLabel = 'Destination';
  String get destinationLabel => _destinationLabel;

  String _goButtonLabel = 'Go';
  String get goButtonLabel => _goButtonLabel;
}
