import 'package:bintex_mobile_driver/app/locator.dart';
import 'package:bintex_mobile_driver/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'Auth Page';
  String get title => _title;

  String _buttonText = 'Login';
  String get buttonText => _buttonText;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
