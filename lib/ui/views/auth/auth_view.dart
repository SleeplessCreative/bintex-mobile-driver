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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(model.title),
              RaisedButton(
                child: Text(model.buttonText),
                onPressed: () => model.navigateToHome(),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AuthViewModel(),
    );
  }
}
