// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvoiceResponse _$CreateInvoiceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInvoiceResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CreateInvoiceResponseToJson(
        CreateInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
