import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:demo_loan_repayment_app/controllers/loan_repayment_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var connectionStatus = 0;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySbuscription;

  // ignore: cancel_subscriptions
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySbuscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  onClose() {
    super.onClose();
    _connectivitySbuscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionStatus = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionStatus = 0;
        update();

        break;
      default:
        Get.snackbar('Network Error', 'Failed to get network connection');
        break;
    }
    if (connectionStatus == 1 || connectionStatus == 2) {
      Get.find<LoanRepaymentController>()
          .addRepaymentToFireStoreWhenNetworkIsActive();
    }
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   initConnectivity();
  //   connectivitySubscription =
  //       connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }
}
