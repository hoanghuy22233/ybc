// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailData _$NewsDetailDataFromJson(Map<String, dynamic> json) {
  return NewsDetailData(
    json['item'] == null
        ? null
        : NewsDetail.fromJson(json['item'] as Map<String, dynamic>),
    json['relate'] == null
        ? null
        : NewsData.fromJson(json['relate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsDetailDataToJson(NewsDetailData instance) =>
    <String, dynamic>{
      'item': instance.item,
      'relate': instance.relate,
    };
