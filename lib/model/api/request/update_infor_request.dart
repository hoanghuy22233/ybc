import 'package:json_annotation/json_annotation.dart';

part 'update_infor_request.g.dart';

@JsonSerializable()
class UpdateInforRequest {
  @JsonKey(name: "intro")
  final String infor;

  UpdateInforRequest({
    this.infor,
  });

  factory UpdateInforRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInforRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInforRequestToJson(this);
}
