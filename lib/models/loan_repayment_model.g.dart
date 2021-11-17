// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_repayment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoanRepaymentModelAdapter extends TypeAdapter<LoanRepaymentModel> {
  @override
  final int typeId = 0;

  @override
  LoanRepaymentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanRepaymentModel(
      fields[0] as String,
      fields[1] as DateTime,
      fields[2] as String,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LoanRepaymentModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nameOfThePayee)
      ..writeByte(1)
      ..write(obj.paymentDate)
      ..writeByte(2)
      ..write(obj.loanType)
      ..writeByte(3)
      ..write(obj.paymentAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanRepaymentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
