import 'package:demo_loan_repayment_app/controllers/image_path_controller.dart';
import 'package:demo_loan_repayment_app/controllers/strings_controller.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: LoginPageLogoAndTextWidgt(),
          ),
          Expanded(
            flex: 2,
            child: LoginPageTextFieldsWidgets(),
          ),
          LoginButtonWidget(),
        ],
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginPageTextFieldsWidgets extends StatelessWidget {
  const LoginPageTextFieldsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginPageLogoAndTextWidgt extends StatelessWidget {
  const LoginPageLogoAndTextWidgt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(ImagePathController.splashImage)),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                StringController.loginPageString,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
