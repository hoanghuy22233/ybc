// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_like_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductLikeListData _$ProductLikeListDataFromJson(Map<String, dynamic> json) {
  return ProductLikeListData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['records_total'] as int,
  );
}

Map<String, dynamic> _$ProductLikeListDataToJson(
        ProductLikeListData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'records_total': instance.recordsTotal,
    };
