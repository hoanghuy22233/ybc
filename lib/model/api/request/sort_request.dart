import 'package:json_annotation/json_annotation.dart';

part 'sort_request.g.dart';

@JsonSerializable()
class SortRequest {
  String name;
  String create;

  SortRequest(this.name, this.create);

  factory SortRequest.fromJson(Map<String, dynamic> json) =>
      _$SortRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SortRequestToJson(this);
}
