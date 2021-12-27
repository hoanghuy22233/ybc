// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetail _$PostDetailFromJson(Map<String, dynamic> json) {
  return PostDetail(
    id: json['id'] as int,
    name: json['name'] as String,
    image: json['image'] as String,
    createdAt: json['created_at'] as String,
    intro: json['intro'] as String,
    multiCat: json['multi_cat'] as String,
    categoryId: json['category_id'] as int,
  );
}

Map<String, dynamic> _$PostDetailToJson(PostDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.createdAt,
      'intro': instance.intro,
      'multi_cat': instance.multiCat,
      'category_id': instance.categoryId,
    };
