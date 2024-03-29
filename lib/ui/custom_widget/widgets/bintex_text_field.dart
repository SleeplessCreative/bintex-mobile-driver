import '../../../datamodels/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../values.dart';
import '../style/bintex_label_textstyle.dart';
import '../style/bintex_text_field_hint_textsytle.dart';
import 'bintex_list_suggestion_container.dart';

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

Widget bintexDropDownFromAPI({
  BuildContext context,
  TextEditingController controller,
  String hintText,
  dynamic model,
  textField type,
}) {
  return TypeAheadField(
    textFieldConfiguration: TextFieldConfiguration(
      controller: controller,
      style: labelTextStyle(fontSize: 16),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: textFieldHintStyle()),
    ),
    suggestionsCallback: (pattern) => model.getSuggestions(pattern),
    itemBuilder: (context, suggestion) {
      return listSuggestionContainer(
        context: context,
        text: suggestion.address,
        withIcon: true,
        icon: Icon(
          Icons.location_on,
          color: BintexColor.primary100(0.6),
        ),
      );
    },
    debounceDuration: Duration(milliseconds: 100),
    hideOnLoading: true,
    hideOnEmpty: true,
    suggestionsBoxDecoration: SuggestionsBoxDecoration(
      elevation: 0.0,
      color: BintexColor.primary200(),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      ),
      constraints: BoxConstraints(
        minHeight: 0.0,
        maxHeight: getScreenHeight(context) * 0.2,
        minWidth: getScreenWidth(context) * 0.8,
        maxWidth: getScreenWidth(context) * 0.8,
      ),
      offsetX: -getScreenWidth(context) * 0.083,
    ),
    onSuggestionSelected: (suggestion) {
      controller.text = suggestion.address;
      type == textField.destination
          ? model.agentDestinationId(suggestion.agentId.toString())
          : model.agentOriginId(suggestion.agentId.toString());
    },
  );
}
