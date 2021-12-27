// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_attr_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByAttrData _$ProductByAttrDataFromJson(Map<String, dynamic> json) {
  return ProductByAttrData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductByAttrDataToJson(ProductByAttrData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
