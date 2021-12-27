import 'package:json_annotation/json_annotation.dart';

part 'login_app_request.g.dart';

@JsonSerializable()
class LoginAppRequest {
  @JsonKey(name: "email")
  final String email;
  final String password;
  final String lat;
  final String long;

  LoginAppRequest( {this.email, this.password, this.lat, this.long});

  factory LoginAppRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginAppRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAppRequestToJson(this);
}
