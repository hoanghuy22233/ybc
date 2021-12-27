import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_suplife_response.g.dart';

@JsonSerializable()
class UpdateSuplifeResponse extends BaseResponse {
  UpdateSuplifeResponse();

  factory UpdateSuplifeResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSuplifeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSuplifeResponseToJson(this);
}
