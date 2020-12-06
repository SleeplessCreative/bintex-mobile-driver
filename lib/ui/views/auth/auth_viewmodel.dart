import 'package:email_validator/email_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../datamodels/user.dart';
import '../../../services/api_service.dart';

class AuthViewModel extends BaseViewModel {
  // Initializing viewmodel
  void initialise() {
    notifyListeners();
  }

  // Service declaration
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  // Function to service
  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  bool _isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  Future<String> _getLoginStatusCode(User data) async {
    return await _apiService.login(data);
  }

  void login({String email, String password}) async {
    User data = User(
      email: email.trim(),
      password: password,
    );

    if (_isEmailValid(data.email)) {
      String loginStatus = await _getLoginStatusCode(data);

      if (loginStatus == "Logged in.") {
        navigateToHome();
      } else {
        showSnackbar(loginStatus);
      }
    } else {
      showSnackbar('Email is not valid');
    }
  }

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    switch (_showPassword) {
      case true:
        {
          _activeEye = _eyeOffDir;
        }
        break;
      case false:
        {
          _activeEye = _eyeDir;
        }
        break;
    }
    notifyListeners();
  }

  void showSnackbar(String message) {
    _snackbarService.showSnackbar(
      message: 'Swipe down to dissmiss',
      title: message,
      duration: Duration(seconds: 10),
    );
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

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String _activeEye = 'lib/assets/image/auth_body/eye.svg';
  String get activeEye => _activeEye;

  String _eyeDir = 'lib/assets/image/auth_body/eye.svg';
  String get eyeDir => _eyeDir;

  String _eyeOffDir = 'lib/assets/image/auth_body/eye-off.svg';
  String get eyeOffDir => _eyeOffDir;

  String _arrowrightDir = 'lib/assets/image/auth_body/arrow-right.svg';
  String get arrowRightDir => _arrowrightDir;

  String _forgotLabel = 'Forgot Something?';
  String get forgotLabel => _forgotLabel;
}
