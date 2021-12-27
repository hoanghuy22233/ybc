// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_birthday_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBirthdayRequest _$UpdateBirthdayRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateBirthdayRequest(
    dateOfBirth: json['birthday'] as String,
  );
}

Map<String, dynamic> _$UpdateBirthdayRequestToJson(
        UpdateBirthdayRequest instance) =>
    <String, dynamic>{
      'birthday': instance.dateOfBirth,
    };
