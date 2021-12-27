import 'package:json_annotation/json_annotation.dart';

part 'register_app_request.g.dart';

@JsonSerializable()
class RegisterAppRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "tel")
  final String tel;
  @JsonKey(name: "password")
  final String password;

  RegisterAppRequest({this.name, this.email, this.tel, this.password});

  factory RegisterAppRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterAppRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAppRequestToJson(this);
}
