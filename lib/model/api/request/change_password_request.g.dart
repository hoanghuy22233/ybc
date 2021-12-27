// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordRequest(
    apiToken: json['api_token'] as String,
    newPassword: json['new_password'] as String,
    oldPassword: json['old_password'] as String,
  );
}

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'api_token': instance.apiToken,
      'new_password': instance.newPassword,
      'old_password': instance.oldPassword,
    };
