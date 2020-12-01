import 'package:bintex_mobile_driver/ui/widgets/auth_body.dart';
import 'package:bintex_mobile_driver/ui/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AuthHeaderSection(
                  appRole: model.appRole,
                ),
              ),
              Expanded(
                child: AuthBodySection(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AuthViewModel(),
    );
  }
}
