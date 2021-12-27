import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_reset_request.g.dart';

@JsonSerializable()
class ForgotPasswordResetRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "code_change_password")
  final String codeChangePassword;

  ForgotPasswordResetRequest({this.email, this.password, this.codeChangePassword});

  factory ForgotPasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResetRequestToJson(this);
}
