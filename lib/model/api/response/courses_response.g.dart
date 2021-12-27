// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResponse _$CoursesResponseFromJson(Map<String, dynamic> json) {
  return CoursesResponse(
    json['data'] == null
        ? null
        : CourseData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CoursesResponseToJson(CoursesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
