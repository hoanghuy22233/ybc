import 'package:json_annotation/json_annotation.dart';

part 'update_birthday_request.g.dart';

@JsonSerializable()
class UpdateBirthdayRequest {
  @JsonKey(name: "birthday")
  final String dateOfBirth;

  UpdateBirthdayRequest({this.dateOfBirth});

  factory UpdateBirthdayRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBirthdayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBirthdayRequestToJson(this);
}
