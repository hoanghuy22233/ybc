// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAppRequest _$LoginAppRequestFromJson(Map<String, dynamic> json) {
  return LoginAppRequest(
    email: json['email'] as String,
    password: json['password'] as String,
    lat: json['lat'] as String,
    long: json['long'] as String,
  );
}

Map<String, dynamic> _$LoginAppRequestToJson(LoginAppRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'lat': instance.lat,
      'long': instance.long,
    };
