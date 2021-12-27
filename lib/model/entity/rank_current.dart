import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'rank_current.g.dart';

@JsonSerializable()
class RankCurrent extends Equatable {
  int level;
  String name;


  RankCurrent(this.level, this.name);

  factory RankCurrent.fromJson(Map<String, dynamic> json) =>
      _$RankCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$RankCurrentToJson(this);

  @override
  List<Object> get props => [level, name,];

  @override
  String toString() {
    return 'RankCurrent{level: $level, name: $name}';
  }
}
