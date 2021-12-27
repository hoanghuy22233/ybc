// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_phone_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneVerifyRequest _$UpdatePhoneVerifyRequestFromJson(
    Map<String, dynamic> json) {
  return UpdatePhoneVerifyRequest(
    phoneNumber: json['phone_number'] as String,
  );
}

Map<String, dynamic> _$UpdatePhoneVerifyRequestToJson(
        UpdatePhoneVerifyRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
    };
