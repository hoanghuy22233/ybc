// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailData _$ProductDetailDataFromJson(Map<String, dynamic> json) {
  return ProductDetailData(
    json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    json['number_review_total'] as int,
    (json['related_product'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductDetailDataToJson(ProductDetailData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'number_review_total': instance.numberReviewTotal,
      'related_product': instance.relatedProduct,
    };
