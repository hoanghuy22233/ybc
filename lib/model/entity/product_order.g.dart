// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return ProductOrder(
    json['product_id'] as int,
    json['product_name'] as String,
    json['product_price'] as int,
    json['product_sale_price'] as int,
    json['product_image'] as String,
    json['product_quantity'] as int,
    json['product_distribute'] as String,
  );
}

Map<String, dynamic> _$ProductOrderToJson(ProductOrder instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'product_sale_price': instance.productSalePrice,
      'product_image': instance.productImage,
      'product_quantity': instance.productQuantity,
      'product_distribute': instance.productDistribute,
    };
