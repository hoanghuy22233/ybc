// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) {
  return Search(
    json['id'] as int,
    json['type'] as int,
    json['search_word'] as String,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'search_word': instance.searchWord,
      'created_at': instance.createdAt,
    };
