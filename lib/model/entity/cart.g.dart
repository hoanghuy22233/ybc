// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    json['id'] as int,
    json['admin_id'] as int,
    json['course_id'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['name'] as String,
    json['intro'] as String,
    json['image'] as String,
    (json['base_price'] as num)?.toDouble(),
    (json['final_price'] as num)?.toDouble(),
    json['lecturer_name'] as String,
    json['category_name'] as String,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'admin_id': instance.adminId,
      'course_id': instance.courseId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name': instance.name,
      'intro': instance.intro,
      'image': instance.image,
      'base_price': instance.basePrice,
      'final_price': instance.finalPrice,
      'lecturer_name': instance.lecturerName,
      'category_name': instance.categoryName,
    };
