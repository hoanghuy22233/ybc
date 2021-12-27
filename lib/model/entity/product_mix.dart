import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_mix.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductMix extends Equatable {
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_price")
  int price;
  @JsonKey(name: "percent_off")
  int percentSale;
  @JsonKey(name: "product_sale_price")
  int priceSale;
  @JsonKey(name: "product_image")
  String image;

  ProductMix(
      {this.price,
      this.image,
      this.productId,
      this.percentSale,
      this.priceSale,
      this.productName});

  factory ProductMix.fromJson(Map<String, dynamic> json) =>
      _$ProductMixFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMixToJson(this);

  Product toProduct() => Product(
      this.productId,
      this.productName,
      null,
      this.price,
      this.priceSale,
      null,
      null,
      null,
      this.percentSale.toDouble(),
      [this.image],
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null);

  @override
  List<Object> get props =>
      [productId, productName, price, priceSale, percentSale, image];
}
