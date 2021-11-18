import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPageController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? mobileNumbr;
  late String password;

  onSaveForMobileField(String? number) {
    mobileNumbr = number;
  }

  onSaveForPassword(String password) {
    this.password = password;
  }

  String? onValidateNumber(String? value) {
    if (value!.length >= 12) {
      return 'Invalid Mobile Number';
    }
    return null;
  }
}
