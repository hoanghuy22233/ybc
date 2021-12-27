// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankData _$RankDataFromJson(Map<String, dynamic> json) {
  return RankData(
    (json['ranking'] as List)
        ?.map(
            (e) => e == null ? null : Rank.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['current_ranking'] == null
        ? null
        : RankCurrent.fromJson(json['current_ranking'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RankDataToJson(RankData instance) => <String, dynamic>{
      'ranking': instance.ranking,
      'current_ranking': instance.currentRanking,
    };
