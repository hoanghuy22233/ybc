import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

part 'banner_data.g.dart';

@JsonSerializable()
class BannerData extends Equatable {
  List<Banners> data;
  BannerData(this.data);

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

  @override
  List<Object> get props => [data];
}
