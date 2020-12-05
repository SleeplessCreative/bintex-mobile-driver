import 'package:flutter/material.dart';

import '../style/bintex_button_label_textstyle.dart';

Container bintexButtonLabel({
  String text,
  String leading: '',
}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: 5),
    child: Text(
      text,
      style: bintexButtonTextStyle(),
    ),
  );
}
