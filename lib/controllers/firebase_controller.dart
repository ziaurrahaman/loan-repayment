import 'package:demo_loan_repayment_app/models/loan_repayment_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference repayments =
      FirebaseFirestore.instance.collection('repayments');

  Future<void> addRepayment(LoanRepaymentModel repayment) {
    // Call the user's CollectionReference to add a new user
    return repayments
        .add({
          'full_name': repayment.nameOfThePayee, // John Doe
          'date': repayment.paymentDate,
          'amount': repayment.paymentAmount, // Stokes and Sons
          'type': repayment.loanType // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
