// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_avatar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAvatarResponse _$UpdateAvatarResponseFromJson(Map<String, dynamic> json) {
  return UpdateAvatarResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateAvatarResponseToJson(
        UpdateAvatarResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
