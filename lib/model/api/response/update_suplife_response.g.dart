// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_suplife_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSuplifeResponse _$UpdateSuplifeResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSuplifeResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateSuplifeResponseToJson(
        UpdateSuplifeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
