import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values.dart';

// First section
Container firstSection({
  BuildContext context,
  String bintexLogoDir,
  String welcomeText,
  String appRoleText,
  String appRole,
  String bintexLineDir,
}) {
  return Container(
    margin: firstSectionMargin(context),
    child: Stack(
      children: <Widget>[
        firstSectionBackground(context),
        firstSectionForeground(
          context: context,
          child: firstSectionForegroundSequence(
            children: listForegroundWidget(
              bintexLogoDir,
              welcomeText,
              appRoleText,
              appRole,
              bintexLineDir,
            ),
          ),
        ),
      ],
    ),
  );
}

Container firstSectionBackground(BuildContext context) {
  return Container(
    height: getAuthHeaderBackgroundHeight(context),
    decoration: BoxDecoration(
      color: BintexColor.accent300(),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60.0),
      ),
    ),
  );
}

Container firstSectionForeground({BuildContext context, Widget child}) {
  return Container(
    height: getAuthHeaderForegroundHeight(context),
    child: child,
  );
}

Column firstSectionForegroundSequence({List<Widget> children}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: children,
  );
}

List<Widget> listForegroundWidget(
  String bintexLogoDir,
  String welcomeText,
  String appRoleText,
  String appRole,
  String bintexLineDir,
) {
  return <Widget>[
    itemForeground(
      child: SvgPicture.asset(bintexLogoDir),
    ),
    itemForeground(
      child: Text(
        welcomeText,
        style: welcomeStyle(),
      ),
    ),
    itemForeground(
      child: Text(
        appRoleText + appRole,
        style: forStyle(),
      ),
    ),
    Container(
      child: SvgPicture.asset(bintexLineDir),
    ),
  ];
}

Container itemForeground({Widget child}) {
  return Container(
    padding: headerPadding(),
    child: child,
  );
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

EdgeInsets firstSectionMargin(BuildContext context) {
  return EdgeInsets.only(
    bottom: getScreenHeight(context) / 15,
  );
}

// Second section
Container secondSection({List<Widget> children}) {
  return Container(
    child: Column(
      children: children,
    ),
  );
}

Container secondSectionLabel(
    {BuildContext context, String text, bool forgot: false}) {
  return Container(
    width: getScreenWidth(context),
    margin: EdgeInsets.symmetric(
      horizontal: 60,
      vertical: 5,
    ),
    child: forgot
        ? Center(
            child: Text(
              text,
              style: labelTextStyle(underlined: true),
            ),
          )
        : Text(
            text,
            style: labelTextStyle(),
          ),
  );
}

Container secondSectionBox({
  BuildContext context,
  Widget child,
  Color color,
}) {
  return Container(
    width: getScreenWidth(context),
    height: getBoxHeight(context),
    margin: EdgeInsets.symmetric(
      horizontal: getScreenWidth(context) / 10,
      vertical: 5,
    ),
    padding: EdgeInsets.only(
      left: 30.0,
      right: 30.0,
    ),
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

TextFormField authTextField({
  String hintText,
  bool passwordInput: false,
  TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    obscureText: passwordInput,
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

Container secondSectionButtonLabel(String text, String arrowRightDir) {
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
        SvgPicture.asset(arrowRightDir),
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
    color: BintexColor.primary100(1),
    fontFamily: 'OpenSans',
    fontSize: 14,
    decoration: underlined ? TextDecoration.underline : TextDecoration.none,
  );
}
