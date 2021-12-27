// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['id'] as int,
    json['receiver_name'] as String,
    json['receiver_phone'] as String,
    json['province_name'] as String,
    json['district_name'] as String,
    json['ward_name'] as String,
    json['province_id'] as String,
    json['district_id'] as String,
    json['ward_id'] as String,
    json['address'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'receiver_name': instance.receiverName,
      'receiver_phone': instance.receiverPhone,
      'province_name': instance.provinceName,
      'district_name': instance.districtName,
      'ward_name': instance.wardName,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'ward_id': instance.wardId,
      'address': instance.address,
      'type': instance.type,
    };
