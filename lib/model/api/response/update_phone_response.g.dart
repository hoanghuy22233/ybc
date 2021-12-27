// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneResponse _$UpdatePhoneResponseFromJson(Map<String, dynamic> json) {
  return UpdatePhoneResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdatePhoneResponseToJson(
        UpdatePhoneResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
