import 'package:json_annotation/json_annotation.dart';

part 'update_phone_verify_request.g.dart';
@JsonSerializable()
class UpdatePhoneVerifyRequest {
  @JsonKey(name: "phone_number")
  final String phoneNumber;

  UpdatePhoneVerifyRequest({this.phoneNumber});

  factory UpdatePhoneVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePhoneVerifyRequestToJson(this);
}