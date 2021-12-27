// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInformationResponse _$UpdateInformationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateInformationResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateInformationResponseToJson(
        UpdateInformationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
