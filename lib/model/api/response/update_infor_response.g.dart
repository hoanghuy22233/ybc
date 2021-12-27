// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_infor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInforResponse _$UpdateInforResponseFromJson(Map<String, dynamic> json) {
  return UpdateInforResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateInforResponseToJson(
        UpdateInforResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
