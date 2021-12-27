import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/courses.dart';

part 'course_data.g.dart';

@JsonSerializable()
class CourseData extends Equatable {
  @JsonKey(name: "current_page")
  int current;
  List<Courses> data;
  CourseData(this.current, this.data);

  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDataToJson(this);

  @override
  List<Object> get props => [current, data];
}
