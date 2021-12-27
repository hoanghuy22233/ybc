import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'rank_check.g.dart';

@JsonSerializable()
class RankCheck extends Equatable {
  double discount;
  @JsonKey(name: "percent_discount")
  double percentDiscount;


  RankCheck(this.discount, this.percentDiscount);

  factory RankCheck.fromJson(Map<String, dynamic> json) =>
      _$RankCheckFromJson(json);

  Map<String, dynamic> toJson() => _$RankCheckToJson(this);

  @override
  List<Object> get props => [discount, percentDiscount,];

  @override
  String toString() {
    return 'RankCheck{discount: $discount, percentDiscount: $percentDiscount}';
  }
}
