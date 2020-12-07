import '../../../datamodels/enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../custom_widget/custom_widget.dart';
import '../../custom_widget/widgets/bintex_button.dart';
import '../../values.dart';
import 'add_viewmodel.dart';

class AddView extends StatelessWidget {
  const AddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputOriginController = TextEditingController();
    final inputDestinationController = TextEditingController();
    return ViewModelBuilder.reactive(
      //onModelReady: (model) => model.getAgentList(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: getScreenHeight(context),
            color: BintexColor.accent300(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                bintexLabel(
                  context: context,
                  text: model.setLabel,
                ),
                bintexBox(
                  context: context,
                  color: BintexColor.primary300(),
                  child: bintexDropDownFromAPI(
                    context: context,
                    hintText: model.originLabel,
                    controller: inputOriginController,
                    model: model,
                    type: textField.origin,
                  ),
                ),
                bintexBox(
                  context: context,
                  color: BintexColor.primary300(),
                  child: bintexDropDownFromAPI(
                    context: context,
                    hintText: model.destinationLabel,
                    controller: inputDestinationController,
                    model: model,
                    type: textField.destination,
                  ),
                ),
                bintexButton(
                  context: context,
                  model: model,
                  function: () {
                    model.driverId('1');
                    return model.addTrip();
                  },
                  label: model.goButtonLabel,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddViewModel(),
    );
  }
}
