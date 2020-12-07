import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../datamodels/driver_trip.dart';
import '../../../services/api_service.dart';
import '../add/add_view.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();

  Future navigateToAdd() async {
    await _navigationService.navigateWithTransition(
      AddView(),
      transition: NavigationTransition.RightToLeft,
      duration: Duration(milliseconds: 300),
    );
  }

  Future getTripHistory() async {
    var result = await _apiService.getTripHistory('1');

    List<History> data = List<History>();
    result.forEach((element) {
      data.add(new History.fromMap(element));
    });

    _histories = data;
    notifyListeners();
  }

  String _title = 'History';
  String get title => _title;

  String _rightArrowDir = 'lib/assets/image/home/arrow-right.svg';
  String get rightArrowDir => _rightArrowDir;

  String _plusDir = 'lib/assets/image/home/plus.svg';
  String get plusDir => _plusDir;

  List<History> _histories;
  List<History> get histories => _histories;
}
