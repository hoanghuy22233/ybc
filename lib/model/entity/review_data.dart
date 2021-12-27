import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_data.g.dart';

@JsonSerializable()
class ReviewData extends Equatable {
  List<Review> list;

  ReviewData(this.list);

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);

  @override
  List<Object> get props => [list];
}
