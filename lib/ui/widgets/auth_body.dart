import 'package:bintex_mobile_driver/ui/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthBodySection extends StatelessWidget {
  const AuthBodySection({Key key}) : super(key: key);

  final String loginLabel = 'Log in to your account';
  final String emailInputHint = 'Email';
  final String passwordInputHint = 'Password';
  final String loginButtonText = 'Login';
  final String forgotLabel = 'Forgot Something?';

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: Text(
                loginLabel,
                style: labelTextStyle(),
              ),
            ),
          ),
          Expanded(
            child: authBox(
              width: MediaQuery.of(context).size.width,
              child: authTextField(emailInputHint),
              color: BintexColor.primary200(),
            ),
          ),
          Expanded(
            child: authBox(
              width: MediaQuery.of(context).size.width,
              child: authTextField(passwordInputHint),
              color: BintexColor.primary200(),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('hi');
              },
              child: authBox(
                width: MediaQuery.of(context).size.width,
                child: buttonLabel(loginButtonText),
                color: BintexColor.accent200(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: Center(
                child: Text(
                  forgotLabel,
                  style: labelTextStyle(underlined: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container authBox({double width, Widget child, Color color}) {
  return Container(
    width: width,
    height: 75,
    margin: EdgeInsets.symmetric(horizontal: 32),
    padding: EdgeInsets.only(left: 30.0, right: 30.0),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(17.0),
      ),
    ),
    child: child,
  );
}

TextFormField authTextField(String hintText) {
  return TextFormField(
    decoration: InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: hintText,
      hintStyle: textFieldHintStyle(),
    ),
  );
}

Container buttonLabel(String text) {
  final String arrowrightDir = 'lib/assets/image/auth_body/arrow-right.svg';

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            text,
            style: buttonTextStyle(),
          ),
        ),
        SvgPicture.asset(arrowrightDir),
      ],
    ),
  );
}

TextStyle textFieldHintStyle() {
  return TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16,
    color: BintexColor.primary100(0.6),
  );
}

TextStyle buttonTextStyle() {
  return TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: BintexColor.primary300(),
  );
}

TextStyle labelTextStyle({bool underlined = false}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14,
    decoration: underlined ? TextDecoration.underline : TextDecoration.none,
  );
}
