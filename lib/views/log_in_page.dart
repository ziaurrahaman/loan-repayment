import 'package:demo_loan_repayment_app/controllers/image_path_controller.dart';
import 'package:demo_loan_repayment_app/controllers/login_page_controller.dart';
import 'package:demo_loan_repayment_app/controllers/size_config_controller.dart';
import 'package:demo_loan_repayment_app/controllers/strings_controller.dart';
import 'package:demo_loan_repayment_app/controllers/theme_controller.dart';
import 'package:demo_loan_repayment_app/views/loan_repayments_history_page.dart';
import 'package:demo_loan_repayment_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: LoginPageLogoAndTextWidgt(),
            ),
            Expanded(
              flex: 3,
              child: LoginPageTextFieldsWidgets(),
            ),
            Expanded(child: LoginButtonWidget()),
          ],
        ),
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoanRepaymentsHistoryPage()));
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 6 * SizeConfigController.widthMultiplier,
            ),
            constraints: BoxConstraints(
                minHeight: 6.5 * SizeConfigController.heightMultiplier,
                maxHeight: 7.9 * SizeConfigController.heightMultiplier),
            height: 7 * SizeConfigController.heightMultiplier,
            decoration: BoxDecoration(
                color: ThemeController.topBarBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                        2 * SizeConfigController.heightMultiplier),
                    bottomLeft: Radius.circular(
                        2 * SizeConfigController.heightMultiplier),
                    topLeft: Radius.circular(
                        2 * SizeConfigController.heightMultiplier),
                    topRight: Radius.circular(
                        2 * SizeConfigController.heightMultiplier))),
            child: Center(
              child: FittedBox(
                child: Text(
                  '${StringController.loginButtonString}',
                  style: Theme.of(context).textTheme.button,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2 * SizeConfigController.heightMultiplier,
        )
      ],
    );
  }
}

class LoginPageTextFieldsWidgets extends StatelessWidget {
  const LoginPageTextFieldsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: 6 * SizeConfigController.widthMultiplier,
              vertical: 2 * SizeConfigController.heightMultiplier),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.circular(10)),
          child: TextFieldWidget(
            controller: Get.find<LoginPageController>().mobileNumberController,
            hintText: 'Mobile Number',
            keyboardType: TextInputType.number,
            obscureText: false,
            onSave: Get.find<LoginPageController>().onSaveForMobileField,
            onValidate: Get.find<LoginPageController>().onValidateNumber,
            prefix: null,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 6 * SizeConfigController.widthMultiplier,
                    vertical: 2 * SizeConfigController.heightMultiplier),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFieldWidget(
                  controller:
                      Get.find<LoginPageController>().mobileNumberController,
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  onSave: Get.find<LoginPageController>().onSaveForMobileField,
                  onValidate: Get.find<LoginPageController>().onValidateNumber,
                  prefix: null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LoginPageLogoAndTextWidgt extends StatelessWidget {
  const LoginPageLogoAndTextWidgt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                    radius: SizeConfigController.isMobilePotrait
                        ? 12 * SizeConfigController.imageSizeMultiplier
                        : 4 * SizeConfigController.imageSizeMultiplier,
                    backgroundImage:
                        AssetImage(ImagePathController.govermentLogoImage))),
          ),
          SizedBox(
            height: 16,
          ),
          FittedBox(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 6 * SizeConfigController.widthMultiplier,
              ),
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
