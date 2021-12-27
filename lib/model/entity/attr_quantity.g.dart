// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attr_quantity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttrQuantity _$AttrQuantityFromJson(Map<String, dynamic> json) {
  return AttrQuantity(
    json['size_id'] as int,
    json['size_name'] as String,
    json['color_id'] as int,
    json['color_name'] as String,
    json['quantity'] as int,
  );
}

Map<String, dynamic> _$AttrQuantityToJson(AttrQuantity instance) =>
    <String, dynamic>{
      'size_id': instance.sizeId,
      'size_name': instance.sizeName,
      'color_id': instance.colorId,
      'color_name': instance.colorName,
      'quantity': instance.quantity,
    };
