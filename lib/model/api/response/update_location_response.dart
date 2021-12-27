import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_location_response.g.dart';

@JsonSerializable()
class UpdateLocationResponse extends BaseResponse {
  UpdateLocationResponse();

  factory UpdateLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLocationResponseToJson(this);
}
