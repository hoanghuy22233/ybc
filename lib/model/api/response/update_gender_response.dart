import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'update_gender_response.g.dart';

@JsonSerializable()
class UpdateGenderResponse extends BaseResponse {
  UpdateGenderResponse();

  factory UpdateGenderResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGenderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGenderResponseToJson(this);
}
