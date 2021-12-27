// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_key_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByKeyData _$ProductByKeyDataFromJson(Map<String, dynamic> json) {
  return ProductByKeyData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductByKeyDataToJson(ProductByKeyData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
