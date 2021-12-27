import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_job_response.g.dart';

@JsonSerializable()
class UpdateJobResponse extends BaseResponse {
  UpdateJobResponse();

  factory UpdateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateJobResponseToJson(this);
}
