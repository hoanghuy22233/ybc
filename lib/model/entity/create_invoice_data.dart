import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_invoice_data.g.dart';

@JsonSerializable()
class CreateInvoiceData extends Equatable {
  @JsonKey(name: "invoice_code")
  String invoiceCode;

  @JsonKey(name: "payment_type")
  int paymentType;

  @JsonKey(name: "bank_name")
  String bankName;

  @JsonKey(name: "account_number")
  String accountNumber;

  @JsonKey(name: "account_name")
  String accountName;

  String hotline;

  CreateInvoiceData(this.invoiceCode, this.paymentType, this.bankName,
      this.accountNumber, this.accountName, this.hotline);

  factory CreateInvoiceData.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceDataToJson(this);

  @override
  List<Object> get props =>
      [invoiceCode, paymentType, bankName, accountNumber, accountName, hotline];

  @override
  String toString() {
    return 'CreateInvoiceData{invoiceCode: $invoiceCode, paymentType: $paymentType, bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName, hotline: $hotline}';
  }
}
