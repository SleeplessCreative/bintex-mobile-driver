import 'package:stacked/stacked.dart';

class AddViewModel extends BaseViewModel {
  void addDriverTrip() {
    print('add');
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
