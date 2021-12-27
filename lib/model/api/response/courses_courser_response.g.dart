// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_courser_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesCategoriesResponse _$CoursesCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return CoursesCategoriesResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryCourser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CoursesCategoriesResponseToJson(
        CoursesCategoriesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
