import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:demo_loan_repayment_app/controllers/connectitvity_controller.dart';
import 'package:demo_loan_repayment_app/controllers/firebase_controller.dart';
import 'package:demo_loan_repayment_app/controllers/loan_repayment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoanRepaymentsHistoryPage extends StatefulWidget {
  LoanRepaymentsHistoryPage({Key? key}) : super(key: key);

  @override
  State<LoanRepaymentsHistoryPage> createState() =>
      _LoanRepaymentsHistoryPageState();
}

class _LoanRepaymentsHistoryPageState extends State<LoanRepaymentsHistoryPage> {
  // String _connectionStatus = 'Unknown';
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Future<void> initConnectivity() async {
  //   ConnectivityResult result = ConnectivityResult.none;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     print(e.toString());
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) {
  //     return Future.value(null);
  //   }

  //   return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //     case ConnectivityResult.mobile:
  //     case ConnectivityResult.none:
  //       setState(() => _connectionStatus = result.toString());
  //       break;
  //     default:
  //       setState(() => _connectionStatus = 'Failed to get connectivity.');
  //       break;
  //   }
  // }

  // @override
  // void initState() {
  //   // ignore: todo
  //   // TODO: implement initState

  //   super.initState();
  //   initConnectivity();
  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  //   // super.initState();
  //   // Get.find<ConnectivityController>().initConnectivity();
  //   // Get.find<ConnectivityController>().connectivitySubscription =
  //   //     Get.find<ConnectivityController>()
  //   //         .connectivity
  //   //         .onConnectivityChanged
  //   //         .listen(Get.find<ConnectivityController>().updateConnectionStatus);
  // }

  // @override
  // void dispose() {
  //   // Get.find<ConnectivityController>().connectivitySubscription.cancel();
  //   // super.dispose();
  //   _connectivitySubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Obx(() {
                print(
                    'listviewLength: ${Get.find<LoanRepaymentController>().repayments.length},');
                return ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                          title: Text(Get.find<LoanRepaymentController>()
                              .repayments[index]
                              .nameOfThePayee),
                          subtitle: Text(Get.find<LoanRepaymentController>()
                              .repayments[index]
                              .paymentDate
                              .toString()),
                          trailing: Text(Get.find<LoanRepaymentController>()
                              .repayments[index]
                              .paymentAmount
                              .toString()),
                        ),
                    itemCount:
                        Get.find<LoanRepaymentController>().repayments.length,
                    shrinkWrap: true);
              })),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Form(
                    key: Get.find<LoanRepaymentController>().formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter the name of the payee'),
                            controller: Get.find<LoanRepaymentController>()
                                .nameController,
                            validator: (value) =>
                                Get.find<LoanRepaymentController>()
                                    .validateName(value!),
                            onSaved: (value) =>
                                Get.find<LoanRepaymentController>().name =
                                    value!,
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(hintText: 'Loan Type'),
                          controller: Get.find<LoanRepaymentController>()
                              .loanTypeController,
                          validator: (value) =>
                              Get.find<LoanRepaymentController>()
                                  .validateLoanType(value!),
                          onSaved: (value) =>
                              Get.find<LoanRepaymentController>().loanType =
                                  value!,
                        )),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(hintText: 'Amount'),
                          controller: Get.find<LoanRepaymentController>()
                              .amountController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Get.find<LoanRepaymentController>()
                                  .validateAmount(value!),
                          onSaved: (value) {
                            Get.find<LoanRepaymentController>().amount =
                                double.parse(value!);
                            print(Get.find<LoanRepaymentController>().amount);
                          },
                        ))
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      Get.find<LoanRepaymentController>()
                          .addRepaymentToLocalOrServer();
                      Get.find<LoanRepaymentController>()
                          .filterHiveBox('human');
                    },
                    child: Text('Add Repayment'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
