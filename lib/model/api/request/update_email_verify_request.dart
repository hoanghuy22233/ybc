import 'package:json_annotation/json_annotation.dart';

part 'update_email_verify_request.g.dart';
@JsonSerializable()
class UpdateEmailVerifyRequest {
  final String email;

  UpdateEmailVerifyRequest({this.email});

  factory UpdateEmailVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEmailVerifyRequestToJson(this);
}