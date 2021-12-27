import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/category_courser.dart';

import 'base_response.dart';

part 'courses_courser_response.g.dart';

@JsonSerializable()
class CoursesCategoriesResponse extends BaseResponse {
  List<CategoryCourser> data;

  CoursesCategoriesResponse(this.data);

  factory CoursesCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesCategoriesResponseToJson(this);
}
