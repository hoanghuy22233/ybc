import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/category_detail.dart';
import 'package:ybc/model/entity/news_data.dart';

import 'base_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends BaseResponse {
  CategoryDetail data;

  CategoryResponse(this.data);

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
