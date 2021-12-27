// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_gender_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGenderResponse _$UpdateGenderResponseFromJson(Map<String, dynamic> json) {
  return UpdateGenderResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateGenderResponseToJson(
        UpdateGenderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
