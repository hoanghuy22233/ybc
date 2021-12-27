import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/news_detail_data.dart';

part 'news_detail_response.g.dart';

@JsonSerializable()
class NewsDetailResponse extends BaseResponse {
  NewsDetailData data;

  NewsDetailResponse(this.data);

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailResponseToJson(this);
}
