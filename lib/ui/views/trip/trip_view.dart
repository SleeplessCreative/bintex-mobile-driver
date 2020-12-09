import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

import '../../../datamodels/trip.dart';
import '../../values.dart';
import 'trip_viewmodel.dart';

class TripView extends StatelessWidget {
  TripView({Key key, this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(this.trip),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: BintexColor.primary200(),
              ),
              SlidingUpPanel(
                controller: model.panelController,
                defaultPanelState: PanelState.CLOSED,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                backdropOpacity: 0.0,
                backdropColor: Colors.transparent,
                backdropEnabled: true,
                backdropTapClosesPanel: true,
                minHeight: 210,
                maxHeight: getScreenHeight(context) * 0.45,
                color: BintexColor.primary300(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                panel: InkWell(
                  onTap: () {
                    model.panelController.isPanelOpen
                        ? model.panelController.close()
                        : model.panelController.open();
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: getScreenWidth(context) * 0.2,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: BintexColor.primary100(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                      ),
                      tripItem(
                        context: context,
                        leading: BintexColor.StatusGreen,
                        top: model.originLabel,
                        center: model.tripData.agentOriginAddress,
                        bottom: model.tripData.agentOriginId,
                      ),
                      tripItem(
                        context: context,
                        leading: BintexColor.StatusYellow,
                        top: model.destinationLabel,
                        center: model.tripData.agentDestinationAddress,
                        bottom: model.tripData.agentDestinationId,
                      ),
                      // bintexButton(
                      //   context: context,
                      //   model: model,
                      //   function: () => print('ayy'),
                      //   label: 'data',
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => TripViewModel(),
    );
  }
}

Widget tripItem({
  BuildContext context,
  String top,
  String center,
  String bottom,
  Color leading,
}) {
  return Container(
    //color: Colors.black,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: leading,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              itemText(
                text: top,
                fontSize: 14,
                color: BintexColor.primary100(0.6),
              ),
              itemText(
                text: center,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: BintexColor.primary100(1),
              ),
              itemText(
                text: bottom,
                fontSize: 14,
                color: BintexColor.primary100(1),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget itemText({
  String text,
  Color color,
  double fontSize,
  FontWeight fontWeight: FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'OpenSans',
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
