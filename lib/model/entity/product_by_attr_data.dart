import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_by_attr_data.g.dart';

@JsonSerializable()
class ProductByAttrData extends Equatable {
  List<Product> list;

  ProductByAttrData(this.list);

  factory ProductByAttrData.fromJson(Map<String, dynamic> json) =>
      _$ProductByAttrDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByAttrDataToJson(this);

  @override
  List<Object> get props => [list];
}
