// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLocationResponse _$UserLocationResponseFromJson(Map<String, dynamic> json) {
  return UserLocationResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : UserLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UserLocationResponseToJson(
        UserLocationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
