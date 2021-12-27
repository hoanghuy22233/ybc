// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRegisterData _$LoginRegisterDataFromJson(Map<String, dynamic> json) {
  return LoginRegisterData(
    data: json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginRegisterDataToJson(LoginRegisterData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
