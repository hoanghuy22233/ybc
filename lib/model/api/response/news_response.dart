import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/news_data.dart';

import 'base_response.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends BaseResponse {
  NewsData data;

  NewsResponse(this.data);

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
