// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRegisterResponse _$LoginRegisterResponseFromJson(
    Map<String, dynamic> json) {
  return LoginRegisterResponse(
    json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$LoginRegisterResponseToJson(
        LoginRegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
