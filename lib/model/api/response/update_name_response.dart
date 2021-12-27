import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_name_response.g.dart';

@JsonSerializable()
class UpdateNameResponse extends BaseResponse {
  UpdateNameResponse();

  factory UpdateNameResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNameResponseToJson(this);
}
