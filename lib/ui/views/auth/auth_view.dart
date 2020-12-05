import 'package:bintex_mobile_driver/ui/custom_widget/widgets/bintex_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../custom_widget/custom_widget.dart';
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
                  bintexLabel(
                    context: context,
                    text: model.loginLabel,
                  ),
                  bintexBox(
                    context: context,
                    color: BintexColor.primary200(),
                    child: bintexTextField(
                      hintText: model.emailInputHint,
                      controller: inputEmailController,
                    ),
                  ),
                  bintexBox(
                    context: context,
                    color: BintexColor.primary200(),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: bintexTextField(
                            hintText: model.passwordInputHint,
                            controller: inputPasswordController,
                            passwordInput: !model.showPassword,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => model.toggleShowPassword(),
                            child: Container(
                              child: SvgPicture.asset(
                                model.activeEye,
                                color: BintexColor.primary100(0.6),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  bintexButton(
                    context: context,
                    function: () => model.login(
                      email: inputEmailController.text.toString(),
                      password: inputPasswordController.text.toString(),
                    ),
                    label: model.loginButtonText,
                    leading: model.arrowRightDir,
                  ),
                  bintexLabel(
                    context: context,
                    text: model.forgotLabel,
                    underline: true,
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
