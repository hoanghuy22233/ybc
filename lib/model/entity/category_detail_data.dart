import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'category_detail.dart';

part 'category_detail_data.g.dart';

@JsonSerializable()
class CategoryDetailData extends Equatable {
  CategoryDetail data;

  CategoryDetailData(this.data);

  factory CategoryDetailData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailDataToJson(this);

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'Category{id: $data}';
  }
}
