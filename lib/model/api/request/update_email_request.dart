import 'package:json_annotation/json_annotation.dart';

part 'update_email_request.g.dart';

@JsonSerializable()
class UpdateEmailRequest {
  final String email;

  UpdateEmailRequest({this.email});

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEmailRequestToJson(this);
}
