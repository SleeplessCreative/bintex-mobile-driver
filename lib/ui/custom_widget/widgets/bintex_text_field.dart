import 'package:flutter/material.dart';

import '../style/bintex_text_field_hint_textsytle.dart';

Widget bintexTextField({
  String hintText: '',
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
