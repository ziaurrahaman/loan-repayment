import 'package:demo_loan_repayment_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocalController extends GetxController {
  Locale? _locale;
  // @override
  // void onInit() {
  //   super.onInit();
  //   _locale = Locale('en');
  // }

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    update();
  }

  void clearLocale() {
    _locale = null;
    update();
  }
}
