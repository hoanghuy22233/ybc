// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateJobResponse _$UpdateJobResponseFromJson(Map<String, dynamic> json) {
  return UpdateJobResponse()
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$UpdateJobResponseToJson(UpdateJobResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
