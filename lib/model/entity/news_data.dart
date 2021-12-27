import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

part 'news_data.g.dart';

@JsonSerializable()
class NewsData extends Equatable {
  @JsonKey(name: "current_page")
  int current;
  List<News> data;
  NewsData(this.current, this.data);

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);

  @override
  List<Object> get props => [current, data];
}
