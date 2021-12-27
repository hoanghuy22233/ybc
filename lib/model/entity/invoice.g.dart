// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    json['id'] as int,
    json['invoice_code'] as String,
    json['receiver_name'] as String,
    json['receiver_phone'] as String,
    json['full_address'] as String,
    json['voucher_name'] as String,
    json['voucher_price'] as int,
    json['promotion_name'] as String,
    json['promotion_price'] as int,
    json['percent_off_price'] as int,
    json['transport_name'] as String,
    json['transport_price'] as int,
    json['payment_type'] as int,
    json['payment_status'] as int,
    json['status'] as int,
    json['total'] as int,
    json['delivery_time'] as String,
    json['note'] as String,
    (json['products'] as List)
        ?.map((e) =>
            e == null ? null : ProductOrder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'invoice_code': instance.invoiceCode,
      'receiver_name': instance.receiverName,
      'receiver_phone': instance.receiverPhone,
      'full_address': instance.fullAddress,
      'voucher_name': instance.voucherName,
      'voucher_price': instance.voucherPrice,
      'promotion_name': instance.promotionName,
      'promotion_price': instance.promotionPrice,
      'percent_off_price': instance.percentOffPrice,
      'transport_name': instance.transportName,
      'transport_price': instance.transportPrice,
      'payment_type': instance.paymentType,
      'payment_status': instance.paymentStatus,
      'status': instance.status,
      'total': instance.total,
      'delivery_time': instance.deliveryTime,
      'note': instance.note,
      'products': instance.products,
    };
