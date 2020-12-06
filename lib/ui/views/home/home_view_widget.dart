import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../datamodels/driver_trip.dart';
import '../../values.dart';

Widget empty() {
  return Container(
    color: BintexColor.primary200(),
    child: Center(
      child: Text('Empty'),
    ),
  );
}

Widget loading() {
  return Container(
    color: BintexColor.primary200(),
    child: Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(BintexColor.accent100()),
      ),
    ),
  );
}

Column listHistory({
  BuildContext context,
  List<History> data,
  String rightArrowDir,
}) {
  return Column(
    children: <Widget>[
      for (var i in data)
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(
            vertical: 5,
          ),
          color: Colors.white,
          child: Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: itemContainer(
                    top: i.districtOrigin,
                    bottom: i.agentOrigin,
                    containerLeft: true,
                    context: context,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    rightArrowDir,
                    color: BintexColor.primary100(0.6),
                    width: 19,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: itemContainer(
                    top: i.districtDestination,
                    bottom: i.agentDestination,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        )
    ],
  );
}

Container itemContainer({
  BuildContext context,
  String top,
  String bottom,
  bool containerLeft: false,
}) {
  return Container(
    margin: containerLeft ? EdgeInsets.only(left: 30) : null,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: <Widget>[
        labelItemContainer(
          text: top,
          context: context,
        ),
        labelItemContainer(
          up: false,
          text: bottom,
          context: context,
        ),
      ],
    ),
  );
}

Container labelItemContainer(
    {bool up: true, String text, BuildContext context}) {
  return Container(
    height: 50,
    alignment: up ? Alignment.bottomLeft : Alignment.topLeft,
    padding: up ? EdgeInsets.only(bottom: 3) : EdgeInsets.only(top: 3),
    child: Text(
      text,
      style: lebelItemTextStyle(
        size: up ? 16.0 : 14.0,
        fontWeight: up ? FontWeight.w600 : FontWeight.normal,
      ),
    ),
  );
}

TextStyle lebelItemTextStyle({double size, FontWeight fontWeight}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    fontSize: size,
    fontWeight: fontWeight,
  );
}

Widget customNavigationBar({BuildContext context, String plusDir}) {
  double buttonHeight = getScreenHeight(context) / 12;
  double buttonWidth = getScreenWidth(context);

  return Container(
    height: buttonHeight,
    width: buttonWidth,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: BintexColor.accent200(),
    ),
    child: SvgPicture.asset(
      plusDir,
      width: 39,
      color: BintexColor.primary300(),
    ),
  );
}

PreferredSizeWidget customAppBar({BuildContext context, String title}) {
  double appbarHeight = getScreenHeight(context) / 6;
  double appbarWidth = getScreenWidth(context);

  return PreferredSize(
      child: Container(
        height: appbarHeight,
        width: appbarWidth,
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(
          left: appbarWidth / 15,
          bottom: appbarHeight / 7,
        ),
        decoration: BoxDecoration(
          color: BintexColor.primary200(),
        ),
        child: Text(title,
            style: TextStyle(
              color: BintexColor.primary100(1),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            )),
      ),
      preferredSize: Size.fromHeight(100));
}
