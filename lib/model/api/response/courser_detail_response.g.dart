// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courser_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourserDetailResponse _$CourserDetailResponseFromJson(
    Map<String, dynamic> json) {
  return CourserDetailResponse(
    json['data'] == null
        ? null
        : CourseDetail.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CourserDetailResponseToJson(
        CourserDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
