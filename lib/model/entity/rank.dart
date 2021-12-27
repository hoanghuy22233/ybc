import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'rank.g.dart';

@JsonSerializable()
class Rank extends Equatable {
  int level;
  String name;
  String description;
  @JsonKey(name: "percent_discount")
  double percentDiscount;
  String conditions;

  Rank(this.level, this.name, this.description, this.percentDiscount,
      this.conditions);

  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);

  Map<String, dynamic> toJson() => _$RankToJson(this);

  @override
  List<Object> get props =>
      [level, name, description, percentDiscount, conditions];

  @override
  String toString() {
    return 'Rank{level: $level, name: $name, description: $description, percentDiscount: $percentDiscount, conditions: $conditions}';
  }
}
