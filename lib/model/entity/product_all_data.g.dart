// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_all_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAllData _$ProductAllDataFromJson(Map<String, dynamic> json) {
  return ProductAllData(
    listProduct: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductAllDataToJson(ProductAllData instance) =>
    <String, dynamic>{
      'list': instance.listProduct,
    };
