import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'Auth Page';
  String get title => _title;

  String _buttonText = 'Login';
  String get buttonText => _buttonText;

  String _appRole = 'Driver';
  String get appRole => _appRole;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
