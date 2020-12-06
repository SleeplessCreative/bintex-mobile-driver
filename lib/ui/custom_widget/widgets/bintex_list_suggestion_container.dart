import 'package:flutter/material.dart';

import '../../values.dart';
import '../style/bintex_label_textstyle.dart';

Widget listSuggestionContainer({
  BuildContext context,
  String text,
  bool withIcon: false,
  Icon icon,
}) {
  return Container(
    alignment: Alignment.centerLeft,
    height: getScreenHeight(context) / 12,
    child: Row(
      children: [
        withIcon
            ? Expanded(
                flex: 1,
                child: icon,
              )
            : Container(),
        Expanded(
          flex: 3,
          child: Text(
            text,
            style: labelTextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}
