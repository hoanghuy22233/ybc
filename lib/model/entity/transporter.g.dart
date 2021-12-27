// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transporter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transporter _$TransporterFromJson(Map<String, dynamic> json) {
  return Transporter(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['price'] as int,
  );
}

Map<String, dynamic> _$TransporterToJson(Transporter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };
