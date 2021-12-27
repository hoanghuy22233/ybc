import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_by_key_data.g.dart';

@JsonSerializable()
class ProductByKeyData extends Equatable {
  List<Product> list;

  ProductByKeyData(this.list);

  factory ProductByKeyData.fromJson(Map<String, dynamic> json) =>
      _$ProductByKeyDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByKeyDataToJson(this);

  @override
  List<Object> get props => [list];
}
