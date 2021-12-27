import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/news_detail.dart';

part 'news_detail_data.g.dart';

@JsonSerializable()
class NewsDetailData extends Equatable {
  NewsDetail item;
  NewsData relate;
  NewsDetailData(
    this.item,
    this.relate,
  );

  factory NewsDetailData.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailDataToJson(this);

  @override
  List<Object> get props => [item, relate];
}
