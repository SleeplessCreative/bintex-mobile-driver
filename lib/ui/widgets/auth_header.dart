import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../values.dart';

class AuthHeaderSection extends StatelessWidget {
  final String appRole;
  const AuthHeaderSection({Key key, this.appRole}) : super(key: key);

  final String welcomeText = 'Welcome to Bintex';
  final String appRoleText = 'For ';
  final String bintexLogoDir = 'lib/assets/image/auth_header/logo-bg.svg';
  final String bintexLineDir = 'lib/assets/image/auth_header/line.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: BintexColor.accent300(),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.0),
            ),
          ),
        ),
        Container(
          height: 330,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: headerPadding(),
                child: SvgPicture.asset(bintexLogoDir),
              ),
              Container(
                padding: headerPadding(),
                child: Text(
                  welcomeText,
                  style: welcomeStyle(),
                ),
              ),
              Container(
                padding: headerPadding(),
                child: Text(
                  appRoleText + appRole,
                  style: forStyle(),
                ),
              ),
              Container(
                child: SvgPicture.asset(bintexLineDir),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle welcomeStyle() {
  return TextStyle(
    fontFamily: 'CrimsonText',
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: BintexColor.primary100(1.0),
  );
}

TextStyle forStyle() {
  return TextStyle(
    fontFamily: 'CrimsonText',
    fontSize: 24,
    color: BintexColor.primary100(1.0),
  );
}

EdgeInsets headerPadding() {
  return EdgeInsets.symmetric(vertical: 1);
}
