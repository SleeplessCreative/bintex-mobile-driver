import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../values.dart';
import '../style/bintex_button_label_textstyle.dart';
import 'bintex_box.dart';

Widget bintexButton({
  BuildContext context,
  dynamic function,
  String leading: '',
  String label,
  dynamic model,
}) {
  return Stack(
    children: <Widget>[
      bintexBox(
        context: context,
        color: BintexColor.accent200(),
        child: InkWell(
          onTap: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  label,
                  style: bintexButtonTextStyle(),
                ),
              ),
              leading.isEmpty ? Container() : SvgPicture.asset(leading),
            ],
          ),
        ),
      ),
      model.isBusy
          ? Positioned(
              top: getBoxHeight(context) / 2.2,
              right: getScreenWidth(context) / 5.5,
              child: SpinKitWave(
                color: BintexColor.primary200(),
                size: 20.0,
              ),
            )
          : Container(),
    ],
  );
}
