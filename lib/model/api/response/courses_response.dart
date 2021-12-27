import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/course_data.dart';

import 'base_response.dart';

part 'courses_response.g.dart';

@JsonSerializable()
class CoursesResponse extends BaseResponse {
  CourseData data;

  CoursesResponse(this.data);

  factory CoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesResponseToJson(this);
}
