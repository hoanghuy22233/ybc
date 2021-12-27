// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceHistoryData _$InvoiceHistoryDataFromJson(Map<String, dynamic> json) {
  return InvoiceHistoryData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Invoice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InvoiceHistoryDataToJson(InvoiceHistoryData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
