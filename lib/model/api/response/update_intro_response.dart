import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_intro_response.g.dart';

@JsonSerializable()
class UpdateIntroResponse extends BaseResponse {
  UpdateIntroResponse();

  factory UpdateIntroResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntroResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateIntroResponseToJson(this);
}
