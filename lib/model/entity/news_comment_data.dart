import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_comment_data.g.dart';

@JsonSerializable()
class NewsCommentData extends Equatable {
  List<NewsComment> rows;

  NewsCommentData(this.rows);

  factory NewsCommentData.fromJson(Map<String, dynamic> json) =>
      _$NewsCommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCommentDataToJson(this);

  @override
  List<Object> get props => [rows];
}
