// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvoiceRequest _$CreateInvoiceRequestFromJson(Map<String, dynamic> json) {
  return CreateInvoiceRequest(
    json['name'] as String,
    json['email'] as String,
    json['address'] as String,
    json['city_id'] as int,
    json['district_id'] as int,
    json['ward_id'] as int,
    json['tel'] as String,
    json['payment_type'] as int,
    json['api_token'] as String,
  );
}

Map<String, dynamic> _$CreateInvoiceRequestToJson(
        CreateInvoiceRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'ward_id': instance.wardId,
      'tel': instance.tel,
      'payment_type': instance.paymentType,
      'api_token': instance.apiToken,
    };
