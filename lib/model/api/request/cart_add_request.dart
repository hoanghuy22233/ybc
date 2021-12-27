import 'package:json_annotation/json_annotation.dart';

part 'cart_add_request.g.dart';

@JsonSerializable()
class CartAddRequest {
  @JsonKey(name: "course_id")
  final int courseId;

  @JsonKey(name: "api_token")
  final String apiToken;

  CartAddRequest(this.courseId, this.apiToken);

  factory CartAddRequest.fromJson(Map<String, dynamic> json) =>
      _$CartAddRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartAddRequestToJson(this);
}
