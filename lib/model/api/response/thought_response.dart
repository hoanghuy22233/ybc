import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/thought.dart';

import 'base_response.dart';

part 'thought_response.g.dart';

@JsonSerializable()
class ThoughtResponse extends BaseResponse {
  List<Thought> data;

  ThoughtResponse(this.data);

  factory ThoughtResponse.fromJson(Map<String, dynamic> json) =>
      _$ThoughtResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtResponseToJson(this);
}
