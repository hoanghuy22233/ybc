import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_like_comment_data.g.dart';

@JsonSerializable()
class NewsLikeCommentData extends Equatable {
  int type;

  NewsLikeCommentData(this.type);

  factory NewsLikeCommentData.fromJson(Map<String, dynamic> json) =>
      _$NewsLikeCommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsLikeCommentDataToJson(this);

  @override
  List<Object> get props => [type];
}
