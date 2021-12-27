// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rank _$RankFromJson(Map<String, dynamic> json) {
  return Rank(
    json['level'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['percent_discount'] as num)?.toDouble(),
    json['conditions'] as String,
  );
}

Map<String, dynamic> _$RankToJson(Rank instance) => <String, dynamic>{
      'level': instance.level,
      'name': instance.name,
      'description': instance.description,
      'percent_discount': instance.percentDiscount,
      'conditions': instance.conditions,
    };
