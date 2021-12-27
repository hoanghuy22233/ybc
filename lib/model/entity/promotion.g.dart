// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return Promotion(
    json['id'] as int,
    (json['percent_off'] as num)?.toDouble(),
    json['is_use_with_voucher'] as int,
    json['invoice_total'] as int,
    json['max_sale'] as int,
    json['start_date'] as String,
    json['end_date'] as String,
  );
}

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'id': instance.id,
      'percent_off': instance.percentOff,
      'is_use_with_voucher': instance.isUseWithVoucher,
      'invoice_total': instance.invoiceTotal,
      'max_sale': instance.maxSale,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
