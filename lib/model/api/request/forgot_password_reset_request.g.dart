// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_reset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResetRequest _$ForgotPasswordResetRequestFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordResetRequest(
    email: json['email'] as String,
    password: json['password'] as String,
    codeChangePassword: json['code_change_password'] as String,
  );
}

Map<String, dynamic> _$ForgotPasswordResetRequestToJson(
        ForgotPasswordResetRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'code_change_password': instance.codeChangePassword,
    };
