import 'package:json_annotation/json_annotation.dart';

part 'update_job_request.g.dart';

@JsonSerializable()
class UpdateJobRequest {
  @JsonKey(name: "job")
  final String job;

  UpdateJobRequest({
    this.job,
  });

  factory  UpdateJobRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateJobRequestToJson(this);
}
