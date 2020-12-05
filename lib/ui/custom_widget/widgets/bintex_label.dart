import 'package:flutter/material.dart';

import '../../values.dart';
import '../style/bintex_label_textstyle.dart';

Widget bintexLabel({
  BuildContext context,
  String text,
  bool underline: false,
}) {
  return Container(
    width: getScreenWidth(context),
    margin: EdgeInsets.symmetric(
      horizontal: 60,
      vertical: 5,
    ),
    child: underline
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
