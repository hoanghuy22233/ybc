// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_information_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInformationRequest _$UpdateInformationRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateInformationRequest(
    address: json['address'] as String,
    birthday: json['birthday'] as String,
    email: json['email'] as String,
    intro: json['intro'] as String,
    job: json['job'] as String,
    name: json['name'] as String,
    tel: json['tel'] as String,
    gender: json['gender'] as int,
  );
}

Map<String, dynamic> _$UpdateInformationRequestToJson(
        UpdateInformationRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'birthday': instance.birthday,
      'email': instance.email,
      'intro': instance.intro,
      'job': instance.job,
      'name': instance.name,
      'tel': instance.tel,
      'gender': instance.gender,
    };
