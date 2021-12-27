// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) {
  return NewsDetail(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['created_at'] as String,
    json['intro'] as String,
    json['multi_cat'] as String,
    json['content'] as String,
    json['product_sidebar'] as String,
  );
}

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.createdAt,
      'intro': instance.intro,
      'multi_cat': instance.multiCat,
      'content': instance.content,
      'product_sidebar': instance.productSidebar,
    };
