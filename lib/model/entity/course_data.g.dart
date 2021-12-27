// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseData _$CourseDataFromJson(Map<String, dynamic> json) {
  return CourseData(
    json['current_page'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Courses.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CourseDataToJson(CourseData instance) =>
    <String, dynamic>{
      'current_page': instance.current,
      'data': instance.data,
    };
