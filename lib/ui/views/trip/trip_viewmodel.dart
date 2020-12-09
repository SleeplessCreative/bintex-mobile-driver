import '../../../datamodels/trip.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class TripViewModel extends BaseViewModel {
  void init(Trip data) {
    setTripData = data;
  }

  PanelController _panelController = new PanelController();
  PanelController get panelController => _panelController;

  String _originLabel = 'Origin';
  String get originLabel => _originLabel;

  String _destinationLabel = 'Destination';
  String get destinationLabel => _destinationLabel;

  Trip _tripData;
  Trip get tripData => _tripData;
  set setTripData(Trip tripData) => this._tripData = tripData;
}
