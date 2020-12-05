import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../datamodels/driver_trip.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'History';
  String get title => _title;

  String _rightArrowDir = 'lib/assets/image/home/arrow-right.svg';
  String get rightArrowDir => _rightArrowDir;

  String _plusDir = 'lib/assets/image/home/plus.svg';
  String get plusDir => _plusDir;

  Histories _histories;
  Histories get histories => _histories;

  Future navigateToAdd() async {
    await _navigationService.navigateTo(Routes.addView);
  }

  Future getHistories(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("lib/datamodels/data.json");

    var historyResult = Histories.fromJson(data);
    _histories = historyResult;
    notifyListeners();
  }
}
