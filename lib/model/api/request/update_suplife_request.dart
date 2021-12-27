import 'package:json_annotation/json_annotation.dart';

part 'update_suplife_request.g.dart';

@JsonSerializable()
class UpdateSuplifeRequest {
  @JsonKey(name: "note")
  final String suplife;

  UpdateSuplifeRequest({
    this.suplife,
  });

  factory UpdateSuplifeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSuplifeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSuplifeRequestToJson(this);
}
