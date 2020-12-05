import 'package:flutter/material.dart';

import '../../values.dart';

Widget bintexBox({
  BuildContext context,
  Widget child,
  Color color,
}) {
  return Container(
    width: getScreenWidth(context),
    height: getBoxHeight(context),
    margin: EdgeInsets.symmetric(
      horizontal: getScreenWidth(context) / 10,
      vertical: getScreenHeight(context) / 90,
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
