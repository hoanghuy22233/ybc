// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_birthday_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBirthdayResponse _$UpdateBirthdayResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBirthdayResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateBirthdayResponseToJson(
        UpdateBirthdayResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
