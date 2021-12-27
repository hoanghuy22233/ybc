// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAddressResponse _$UpdateAddressResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAddressResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateAddressResponseToJson(
        UpdateAddressResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
