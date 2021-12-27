import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_like_list_data.g.dart';

@JsonSerializable()
class ProductLikeListData extends Equatable {
  List<Product> list;
  @JsonKey(name: "records_total")
  int recordsTotal;

  ProductLikeListData(this.list, this.recordsTotal);

  factory ProductLikeListData.fromJson(Map<String, dynamic> json) =>
      _$ProductLikeListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLikeListDataToJson(this);

  @override
  List<Object> get props => [list, recordsTotal];
}
