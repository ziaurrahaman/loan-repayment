import 'package:demo_loan_repayment_app/utils/hom_page_menu_lists.dart';
import 'package:demo_loan_repayment_app/views/loan_repayments_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {
  homePageGridItemTap(int index, BuildContext context) {
    if (home_page_menus[index].nameOfTheMenu == 'Offline Transaction') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoanRepaymentsHistoryPage()));
    }
  }
}
