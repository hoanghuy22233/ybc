import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'product_order.g.dart';

@JsonSerializable()
class ProductOrder extends Equatable {
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_price")
  int productPrice;
  @JsonKey(name: "product_sale_price")
  int productSalePrice;
  @JsonKey(name: "product_image")
  String productImage;
  @JsonKey(name: "product_quantity")
  int productQuantity;
  @JsonKey(name: "product_distribute")
  String productDistribute;

  ProductOrder(
      this.productId,
      this.productName,
      this.productPrice,
      this.productSalePrice,
      this.productImage,
      this.productQuantity,
      this.productDistribute);

  factory ProductOrder.fromJson(Map<String, dynamic> json) => _$ProductOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderToJson(this);

  @override
  List<Object> get props => [
        productId,
        productName,
        productPrice,
        productSalePrice,
        productImage,
        productQuantity,
        productDistribute
      ];

  @override
  String toString() {
    return 'ProductOrder{productId: $productId, productName: $productName, productPrice: $productPrice, productSalePrice: $productSalePrice, productImage: $productImage, productQuantity: $productQuantity, productDistribute: $productDistribute}';
  }
}
