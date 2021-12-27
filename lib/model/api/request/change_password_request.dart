import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: "api_token")
  final String apiToken;
  @JsonKey(name: "new_password")
  final String newPassword;
  @JsonKey(name: "old_password")
  final String oldPassword;

  ChangePasswordRequest({this.apiToken, this.newPassword, this.oldPassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
