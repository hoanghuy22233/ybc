// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_intro_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateIntroResponse _$UpdateIntroResponseFromJson(Map<String, dynamic> json) {
  return UpdateIntroResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateIntroResponseToJson(
        UpdateIntroResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
