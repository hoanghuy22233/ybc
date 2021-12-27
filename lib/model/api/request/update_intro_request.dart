import 'package:json_annotation/json_annotation.dart';

part 'update_intro_request.g.dart';

@JsonSerializable()
class UpdateIntroRequest {
  @JsonKey(name: "intro")
  final String intro;

  UpdateIntroRequest({
    this.intro,
  });

  factory  UpdateIntroRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntroRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateIntroRequestToJson(this);
}
