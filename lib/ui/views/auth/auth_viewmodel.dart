import 'package:bintex_mobile_driver/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../datamodels/user.dart';

class AuthViewModel extends BaseViewModel {
  //Service declaration
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();

  // Function to service
  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  void login({String email, String password}) async {
    User data = User(email: email, password: password);
    if (await _apiService.login(data)) {
      navigateToHome();
    } else {
      print('gagal');
    }
  }

  // Model for UI
  String _welcomeText = 'Welcome to Bintex';
  String get welcomeText => _welcomeText;

  String _appRoleText = 'For ';
  String get appRoleText => _appRoleText;

  String _appRole = 'Driver';
  String get appRole => _appRole;

  String _bintexLogoDir = 'lib/assets/image/auth_header/logo-bg.svg';
  String get bintexLogoDir => _bintexLogoDir;

  String _bintexLineDir = 'lib/assets/image/auth_header/line.svg';
  String get bintexLineDir => _bintexLineDir;

  String _loginLabel = 'Login to your account';
  String get loginLabel => _loginLabel;

  String _emailInputHint = 'Email';
  String get emailInputHint => _emailInputHint;

  String _passwordInputHint = 'Password';
  String get passwordInputHint => _passwordInputHint;

  String _loginButtonText = 'Login';
  String get loginButtonText => _loginButtonText;

  String _arrowrightDir = 'lib/assets/image/auth_body/arrow-right.svg';
  String get arrowRightDir => _arrowrightDir;

  String _forgotLabel = 'Forgot Something?';
  String get forgotLabel => _forgotLabel;
}
