import 'package:hive/hive.dart';
part 'loan_repayment_model.g.dart';

@HiveType(typeId: 0)
class LoanRepaymentModel {
  @HiveField(0)
  late String nameOfThePayee;
  @HiveField(1)
  late DateTime paymentDate;
  @HiveField(2)
  late String loanType;
  @HiveField(3)
  late double paymentAmount;

  LoanRepaymentModel(
      this.nameOfThePayee, this.paymentDate, this.loanType, this.paymentAmount);
}
