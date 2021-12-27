import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

import 'barrel_entity.dart';
import 'home_data.dart';

part 'home_data_data.g.dart';

@JsonSerializable()
class HomeDataData extends Equatable {
  List<HomeData> categories;

  HomeDataData({this.categories});

  factory HomeDataData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataDataToJson(this);

  @override
  List<Object> get props => [categories];
}
