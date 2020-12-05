import 'package:flutter/material.dart';

import '../../values.dart';

TextStyle labelTextStyle({bool underlined = false}) {
  return TextStyle(
    color: BintexColor.primary100(1),
    fontFamily: 'OpenSans',
    fontSize: 14,
    decoration: underlined ? TextDecoration.underline : TextDecoration.none,
  );
}
