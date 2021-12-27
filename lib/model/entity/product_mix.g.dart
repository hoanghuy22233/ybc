// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMix _$ProductMixFromJson(Map<String, dynamic> json) {
  return ProductMix(
    price: json['product_price'] as int,
    image: json['product_image'] as String,
    productId: json['product_id'] as int,
    percentSale: json['percent_off'] as int,
    priceSale: json['product_sale_price'] as int,
    productName: json['product_name'] as String,
  );
}

Map<String, dynamic> _$ProductMixToJson(ProductMix instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.price,
      'percent_off': instance.percentSale,
      'product_sale_price': instance.priceSale,
      'product_image': instance.image,
    };
