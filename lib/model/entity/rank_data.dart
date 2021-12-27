import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rank_data.g.dart';

@JsonSerializable()
class RankData extends Equatable {
  List<Rank> ranking;
  @JsonKey(name: "current_ranking")
  RankCurrent currentRanking;

  RankData(this.ranking, this.currentRanking);

  factory RankData.fromJson(Map<String, dynamic> json) =>
      _$RankDataFromJson(json);

  Map<String, dynamic> toJson() => _$RankDataToJson(this);

  @override
  List<Object> get props => [ranking, currentRanking];

  @override
  String toString() {
    return 'RankData{ranking: $ranking, currentRanking: $currentRanking}';
  }
}
