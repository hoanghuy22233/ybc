// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    json['id'] as int,
    json['course_id'] as int,
    json['name'] as String,
    json['intro'] as String,
    json['image'] as String,
    (json['base_price'] as num)?.toDouble(),
    (json['final_price'] as num)?.toDouble(),
    json['lecturer_name'] as String,
    (json['total_price'] as num)?.toDouble(),
    json['type'] as int,
    json['status'] as int,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'name': instance.name,
      'intro': instance.intro,
      'image': instance.image,
      'base_price': instance.basePrice,
      'final_price': instance.finalPrice,
      'lecturer_name': instance.lecturerName,
      'total_price': instance.totalPrice,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
