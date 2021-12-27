import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/entity/courses_detail.dart';

part 'courser_detail_response.g.dart';

@JsonSerializable()
class CourserDetailResponse extends BaseResponse {
  CourseDetail data;

  CourserDetailResponse(this.data);

  factory CourserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CourserDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourserDetailResponseToJson(this);
}
