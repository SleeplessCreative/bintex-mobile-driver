import 'package:bintex_mobile_driver/ui/custom_widget/widgets/bintex_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../custom_widget/custom_widget.dart';
import '../../values.dart';
import 'add_viewmodel.dart';

class AddView extends StatelessWidget {
  const AddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputOriginController = TextEditingController();
    final inputDestinationController = TextEditingController();
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
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
                child: bintexTextField(
                  hintText: model.originLabel,
                  controller: inputOriginController,
                ),
              ),
              bintexBox(
                context: context,
                color: BintexColor.primary300(),
                child: bintexTextField(
                  hintText: model.destinationLabel,
                  controller: inputDestinationController,
                ),
              ),
              bintexButton(
                function: () => model.addDriverTrip(),
                context: context,
                label: model.goButtonLabel,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddViewModel(),
    );
  }
}
