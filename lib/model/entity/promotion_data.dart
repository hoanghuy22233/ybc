import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_data.g.dart';

@JsonSerializable()
class PromotionData extends Equatable {
  @JsonKey(name: "rows")
  List<Promotion> rows;

  PromotionData(this.rows);

  factory PromotionData.fromJson(Map<String, dynamic> json) =>
      _$PromotionDataFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionDataToJson(this);

  @override
  List<Object> get props => [rows];
}
