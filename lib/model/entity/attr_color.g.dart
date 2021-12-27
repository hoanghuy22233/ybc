// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attr_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttrColor _$AttrColorFromJson(Map<String, dynamic> json) {
  return AttrColor(
    id: json['id'] as int,
    name: json['name'] as String,
    colorCode: json['color_code'] as String,
  );
}

Map<String, dynamic> _$AttrColorToJson(AttrColor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color_code': instance.colorCode,
    };
