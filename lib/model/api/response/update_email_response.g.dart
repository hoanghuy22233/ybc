// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmailResponse _$UpdateEmailResponseFromJson(Map<String, dynamic> json) {
  return UpdateEmailResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateEmailResponseToJson(
        UpdateEmailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
