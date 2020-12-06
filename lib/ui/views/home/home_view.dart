import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../values.dart';
import 'home_view_widget.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.getTripHistory(),
      builder: (context, model, child) => Scaffold(
        appBar: customAppBar(
          context: context,
          title: model.title,
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            model.navigateToAdd();
          },
          child: customNavigationBar(
            context: context,
            plusDir: model.plusDir,
          ),
        ),
        body: model.histories == null
            ? loading()
            : model.histories.isEmpty
                ? empty()
                : SingleChildScrollView(
                    child: Container(
                      color: BintexColor.primary200(),
                      child: listHistory(
                        context: context,
                        data: model.histories,
                        rightArrowDir: model.rightArrowDir,
                      ),
                    ),
                  ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
