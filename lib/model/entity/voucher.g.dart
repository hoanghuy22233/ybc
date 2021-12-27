// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return Voucher(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['detail_voucher'] as String,
    (json['point'] as num)?.toDouble(),
    json['type'] as int,
    (json['percent_off'] as num)?.toDouble(),
    json['sale_price'] as int,
    json['max_sale_price'] as int,
    (json['invoice_total'] as num)?.toDouble(),
    json['expires_at'] as String,
  )..index = json['index'] as int;
}

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'detail_voucher': instance.detailVoucher,
      'point': instance.point,
      'type': instance.type,
      'percent_off': instance.percentOff,
      'sale_price': instance.salePrice,
      'max_sale_price': instance.maxSalePrice,
      'invoice_total': instance.invoiceTotal,
      'expires_at': instance.expiresAt,
      'index': instance.index,
    };
