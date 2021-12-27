// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLocationResponse _$UpdateLocationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLocationResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateLocationResponseToJson(
        UpdateLocationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
