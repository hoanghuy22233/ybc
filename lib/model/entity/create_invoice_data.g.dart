// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvoiceData _$CreateInvoiceDataFromJson(Map<String, dynamic> json) {
  return CreateInvoiceData(
    json['invoice_code'] as String,
    json['payment_type'] as int,
    json['bank_name'] as String,
    json['account_number'] as String,
    json['account_name'] as String,
    json['hotline'] as String,
  );
}

Map<String, dynamic> _$CreateInvoiceDataToJson(CreateInvoiceData instance) =>
    <String, dynamic>{
      'invoice_code': instance.invoiceCode,
      'payment_type': instance.paymentType,
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'hotline': instance.hotline,
    };
