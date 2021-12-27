import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_all_data.g.dart';

@JsonSerializable()
class ProductAllData extends Equatable {
  @JsonKey(name: "list")
  List<Product> listProduct;

  ProductAllData({this.listProduct});

  factory ProductAllData.fromJson(Map<String, dynamic> json) =>
      _$ProductAllDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAllDataToJson(this);

  @override
  List<Object> get props => [listProduct];
}
