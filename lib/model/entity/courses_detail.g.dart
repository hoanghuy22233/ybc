// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetail _$CourseDetailFromJson(Map<String, dynamic> json) {
  return CourseDetail(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['intro'] as String,
    json['content'] as String,
    json['slug'] as String,
    json['multi_cat'] as String,
    (json['base_price'] as num)?.toDouble(),
    (json['final_price'] as num)?.toDouble(),
    json['status'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['time'] as String,
    json['meta_title'] as String,
    json['meta_description'] as String,
    json['company_id'] as int,
    json['category_id'] as int,
    json['order_no'] as int,
    json['menu_id'] as int,
    json['type'] as String,
    json['level'] as String,
    json['utilities'] as String,
    json['date_of_possession'] as String,
    json['certificate'] as int,
    json['tags'] as String,
    json['document'],
    json['category'] == null
        ? null
        : categoryCourse.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CourseDetailToJson(CourseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'intro': instance.intro,
      'content': instance.content,
      'slug': instance.slug,
      'multi_cat': instance.multiCat,
      'base_price': instance.basePrice,
      'final_price': instance.finalPrice,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'time': instance.time,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'company_id': instance.companyId,
      'category_id': instance.categoryId,
      'order_no': instance.orderNo,
      'menu_id': instance.menuId,
      'type': instance.type,
      'level': instance.level,
      'utilities': instance.utilities,
      'date_of_possession': instance.dateOfPossession,
      'certificate': instance.certificate,
      'tags': instance.tags,
      'document': instance.document,
      'category': instance.category,
    };
