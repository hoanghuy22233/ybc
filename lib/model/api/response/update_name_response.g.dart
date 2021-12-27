// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNameResponse _$UpdateNameResponseFromJson(Map<String, dynamic> json) {
  return UpdateNameResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateNameResponseToJson(UpdateNameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
