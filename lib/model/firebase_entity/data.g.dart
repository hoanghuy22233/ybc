// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['type_id'] as String,
    json['body'] as String,
    json['type'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'type_id': instance.typeId,
      'body': instance.body,
      'type': instance.type,
      'title': instance.title,
    };
