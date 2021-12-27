import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_birthday_response.g.dart';

@JsonSerializable()
class UpdateBirthdayResponse extends BaseResponse {
  UpdateBirthdayResponse();

  factory UpdateBirthdayResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBirthdayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBirthdayResponseToJson(this);
}
