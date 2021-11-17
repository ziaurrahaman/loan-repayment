import 'package:demo_loan_repayment_app/controllers/connectitvity_controller.dart';
import 'package:demo_loan_repayment_app/controllers/firebase_controller.dart';
import 'package:demo_loan_repayment_app/controllers/loan_repayment_controller.dart';
import 'package:get/get.dart';

class AllControllerBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<LoanRepaymentController>(LoanRepaymentController());
    Get.put<ConnectivityController>(ConnectivityController());
    Get.put<FirebaseController>(FirebaseController());
  }
}
