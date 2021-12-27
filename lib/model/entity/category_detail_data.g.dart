// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailData _$CategoryDetailDataFromJson(Map<String, dynamic> json) {
  return CategoryDetailData(
    json['data'] == null
        ? null
        : CategoryDetail.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryDetailDataToJson(CategoryDetailData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
