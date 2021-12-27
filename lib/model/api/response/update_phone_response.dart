import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_phone_response.g.dart';

@JsonSerializable()
class UpdatePhoneResponse extends BaseResponse {
  UpdatePhoneResponse();

  factory UpdatePhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePhoneResponseToJson(this);
}
