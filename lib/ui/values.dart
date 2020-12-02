import 'package:flutter/material.dart';

class BintexColor {
  static Color primary100(double opacity) {
    return Color.fromRGBO(42, 61, 102, opacity);
  }

  static Color primary200() {
    return const Color(0xFFF4F7FF);
  }

  static Color primary300() {
    return const Color(0xFFFFFFFF);
  }

  static Color accent100() {
    return const Color(0xFF5D54A4);
  }

  static Color accent200() {
    return const Color(0xFFB99AFF);
  }

  static Color accent300() {
    return const Color(0xFFD8C7FF);
  }
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getAuthHeaderBackgroundHeight(BuildContext context) {
  return getScreenHeight(context) / 45.0 * 17.0;
}

double getAuthHeaderForegroundHeight(BuildContext context) {
  return getAuthHeaderBackgroundHeight(context) + 25.0;
}

double getBoxHeight(BuildContext context) {
  return getScreenHeight(context) / 12.5;
}
