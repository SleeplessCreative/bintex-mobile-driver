import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../values.dart';
import 'auth_view_widget.dart';
import 'auth_viewmodel.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputEmailController = TextEditingController();
    final inputPasswordController = TextEditingController();

    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              firstSection(
                context: context,
                bintexLogoDir: model.bintexLogoDir,
                bintexLineDir: model.bintexLineDir,
                welcomeText: model.welcomeText,
                appRoleText: model.appRoleText,
                appRole: model.appRole,
              ),
              secondSection(
                children: <Widget>[
                  secondSectionLabel(
                    context: context,
                    text: model.loginLabel,
                  ),
                  secondSectionBox(
                    context: context,
                    color: BintexColor.primary200(),
                    child: authTextField(
                      hintText: model.emailInputHint,
                      controller: inputEmailController,
                    ),
                  ),
                  secondSectionBox(
                    context: context,
                    color: BintexColor.primary200(),
                    child: authTextField(
                      hintText: model.passwordInputHint,
                      controller: inputPasswordController,
                      passwordInput: true,
                    ),
                  ),
                  InkWell(
                    onTap: () => model.login(
                      email: inputEmailController.text.toString(),
                      password: inputPasswordController.text.toString(),
                    ),
                    child: secondSectionBox(
                      context: context,
                      color: BintexColor.accent200(),
                      child: secondSectionButtonLabel(
                        model.loginButtonText,
                        model.arrowRightDir,
                      ),
                    ),
                  ),
                  secondSectionLabel(
                    context: context,
                    text: model.forgotLabel,
                    forgot: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AuthViewModel(),
    );
  }
}
