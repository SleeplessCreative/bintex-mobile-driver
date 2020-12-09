import 'package:flutter/material.dart';

import '../../values.dart';

TextStyle labelTextStyle({
  bool underlined = false,
  double fontSize: 14,
}) {
  return TextStyle(
    color: BintexColor.primary100(1),
    fontFamily: 'OpenSans',
    fontSize: fontSize,
    decoration: underlined ? TextDecoration.underline : TextDecoration.none,
  );
}
