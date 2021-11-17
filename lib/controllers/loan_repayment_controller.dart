import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_loan_repayment_app/controllers/connectitvity_controller.dart';
import 'package:demo_loan_repayment_app/models/loan_repayment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LoanRepaymentController extends GetxController {
  int boxLength = 0;
  var repayments = [].obs;
  // LoanRepaymentModel repayment = LoanRepaymentModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController loanTypeController;
  late TextEditingController amountController;
  var name = '';
  var paymentDate = '';
  var loanType = '';
  var amount = 0.0;
  var loanRepaymentBox;
  var encryptionKey;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference repaymentsOfLoan =
      FirebaseFirestore.instance.collection('repayments');

  @override
  void onInit() async {
    nameController = TextEditingController();
    loanTypeController = TextEditingController();
    amountController = TextEditingController();
    Hive.registerAdapter(
      LoanRepaymentModelAdapter(),
    );
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    var secureKey = await secureStorage.read(key: 'key');
    encryptionKey = base64Url.decode(secureKey!);
    print('Encryption key: $encryptionKey');

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    loanTypeController.dispose();
    amountController.dispose();
    super.onClose();
  }

  String? validateName(String name) {
    if (name.isEmpty)
      return 'Plaese enter the name of loan payee';
    else
      return null;
  }

  String? validateAmount(String? name) {
    if (name!.isEmpty)
      return 'Plaese enter a amount';
    else
      return null;
  }

  String? validateLoanType(String? name) {
    if (name!.isEmpty)
      return 'Plaese enter loan type';
    else
      return null;
  }

  bool isEmpty() {
    Box box;
    box = Hive.box('LoanRepaymentBox');
    if (box.length > 0) {
      return false;
    }
    return true;
  }

  addRepaymentToFireStoreWhenNetworkIsActive() async {
    Box box;
    var lrPayments = [];

    try {
      box = Hive.box('LoanRepaymentBox');

      for (int i = 0; i < box.length; i++) {
        lrPayments.add(box.getAt(i));
      }
    } catch (error) {}
    try {
      for (int i = 0; i < lrPayments.length; i++) {
        box = Hive.box('LoanRepaymentBox');
        if (box.isNotEmpty) {
          await repaymentsOfLoan.add({
            'full_name': lrPayments[i].nameOfThePayee, // John Doe
            'date': lrPayments[i].paymentDate,
            'amount': lrPayments[i].paymentAmount, // Stokes and Sons
            'type': lrPayments[i].loanType // 42
          }).then((value) async {
            var keys = box.keys.toList();

            await box.delete(keys[0]).then((value) {
              retrieveAllLoanRepayments();
            });

            box.keys;
          });
        }
      }
    } catch (error) {}
  }

  Future<void> addRepaymentToFireStore() {
    LoanRepaymentModel repaymentModel =
        LoanRepaymentModel(name, DateTime.now(), loanType, amount);
    // Call the user's CollectionReference to add a new user
    return repaymentsOfLoan
        .add({
          'full_name': repaymentModel.nameOfThePayee, // John Doe
          'date': repaymentModel.paymentDate,
          'amount': repaymentModel.paymentAmount, // Stokes and Sons
          'type': repaymentModel.loanType // 42
        })
        .then((value) => print("repayment Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  storeLoanRepaymentInLocalStorage() async {
    LoanRepaymentModel repaymentModel =
        LoanRepaymentModel(name, DateTime.now(), loanType, amount);
    var loanRepaymentBox = await Hive.openBox('LoanRepaymentBox',
        encryptionCipher: HiveAesCipher(encryptionKey));
    loanRepaymentBox.add(repaymentModel);
    retrieveAllLoanRepayments();
  }

  getBoxLength() {
    Box box;
    box = Hive.box('db');
    return box.length;
  }

  storeLoanRepaymentInServer() async {
    LoanRepaymentModel repaymentModel =
        LoanRepaymentModel(name, DateTime.now(), loanType, amount);

    loanRepaymentBox.add(repaymentModel);
    retrieveAllLoanRepayments();
    /*
   Box box;
    print("Getting todos");
    try {
      box = Hive.box('db');
    } catch (error) {
      box = await Hive.openBox('db');
      print(error);
    }

    var tds = box.get('todos');
    print("TODOS $tds");
    if (tds != null) todos.value = tds;
    for (Todo todo in todos) {
      if (todo.isDone) {
        done.add(todo);
      } else {
        remaining.add(todo);
      }
    }

    */
  }

  retrieveAllLoanRepayments() {
    repayments.value = [];
    Box box;
    try {
      box = Hive.box('LoanRepaymentBox');

      for (int i = 0; i < box.length; i++) {
        repayments.add(box.getAt(i));
        // box.getAt(i).nameOfThePayee;
      }
    } catch (error) {}
  }

  addRepaymentToLocalOrServer() {
    print('network: ${Get.find<ConnectivityController>().connectionStatus}}');
    print('clicked');
    if (Get.find<LoanRepaymentController>().formKey.currentState!.validate()) {
      if (Get.find<ConnectivityController>().connectionStatus == 1 ||
          Get.find<ConnectivityController>().connectionStatus == 2) {
        Get.find<LoanRepaymentController>().formKey.currentState!.save();
        Get.find<LoanRepaymentController>().addRepaymentToFireStore();
      } else {
        Get.find<LoanRepaymentController>().formKey.currentState!.save();
        Get.find<LoanRepaymentController>().storeLoanRepaymentInLocalStorage();
      }
    }
  }

  filterHiveBox(String name) {
    var lRepayments = [];
    Box box;
    try {
      box = Hive.box('LoanRepaymentBox');

      for (int i = 0; i < box.length; i++) {
        lRepayments.add(box.get(i));
      }
    } catch (error) {}
    // lRepayments
    //     .where((item) => item.paymentAmount == 799)
    //     .forEach((item) => print('humanAMount: ${item.nameOfThePayee}'));
  }
}
