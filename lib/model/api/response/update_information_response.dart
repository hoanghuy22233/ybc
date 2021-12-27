import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_information_response.g.dart';

@JsonSerializable()
class UpdateInformationResponse extends BaseResponse {
  UpdateInformationResponse();

  factory UpdateInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInformationResponseToJson(this);
}
