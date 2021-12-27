// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAppRequest _$RegisterAppRequestFromJson(Map<String, dynamic> json) {
  return RegisterAppRequest(
    name: json['name'] as String,
    email: json['email'] as String,
    tel: json['tel'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterAppRequestToJson(RegisterAppRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'tel': instance.tel,
      'password': instance.password,
    };
