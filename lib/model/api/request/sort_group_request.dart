import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/request/sort_request.dart';

part 'sort_group_request.g.dart';

@JsonSerializable()
class SortGroupRequest {
  SortRequest sorts;

  SortGroupRequest(this.sorts);

  factory SortGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$SortGroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SortGroupRequestToJson(this);
}
