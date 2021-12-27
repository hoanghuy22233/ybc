// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneRequest _$UpdatePhoneRequestFromJson(Map<String, dynamic> json) {
  return UpdatePhoneRequest(
    phoneNumber: json['tel'] as String,
  );
}

Map<String, dynamic> _$UpdatePhoneRequestToJson(UpdatePhoneRequest instance) =>
    <String, dynamic>{
      'tel': instance.phoneNumber,
    };
