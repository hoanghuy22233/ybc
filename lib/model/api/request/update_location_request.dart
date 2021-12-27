import 'package:json_annotation/json_annotation.dart';

part 'update_location_request.g.dart';

@JsonSerializable()
class UpdateLocationRequest {
  @JsonKey(name: "api_token")
  final String apiToken;
  @JsonKey(name: "lat")
  final String lat;
  @JsonKey(name: "long")
  final String long;

  UpdateLocationRequest(this.apiToken, this.lat, this.long,);

  factory UpdateLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLocationRequestToJson(this);
}
