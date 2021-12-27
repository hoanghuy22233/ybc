// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankCheck _$RankCheckFromJson(Map<String, dynamic> json) {
  return RankCheck(
    (json['discount'] as num)?.toDouble(),
    (json['percent_discount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RankCheckToJson(RankCheck instance) => <String, dynamic>{
      'discount': instance.discount,
      'percent_discount': instance.percentDiscount,
    };
