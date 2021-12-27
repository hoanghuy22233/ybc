import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_email_response.g.dart';

@JsonSerializable()
class UpdateEmailResponse extends BaseResponse {
  UpdateEmailResponse();

  factory UpdateEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEmailResponseToJson(this);
}
