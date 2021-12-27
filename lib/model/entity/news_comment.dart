import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'news_comment.g.dart';

@JsonSerializable()
class NewsComment extends Equatable {
  final int id;
  @JsonKey(name: "author_name")
  final String authorName;
  @JsonKey(name: "author_avatar")
  final String authorAvatar;
  @JsonKey(name: "news_id")
  final int newsId;
  @JsonKey(name: "parent_id")
  final int parentId;
  final String content;
  @JsonKey(name: "children")
  final List<NewsComment> children;
  @JsonKey(name: "like_total")
  final int likeTotal;
  @JsonKey(name: "is_liked")
  final int isLiked;
  @JsonKey(name: "created_at")
  final String createdAt;

  NewsComment(
      this.id,
      this.authorName,
      this.authorAvatar,
      this.newsId,
      this.parentId,
      this.content,
      this.children,
      this.likeTotal,
      this.isLiked,
      this.createdAt);

  factory NewsComment.fromJson(Map<String, dynamic> json) =>
      _$NewsCommentFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCommentToJson(this);

  @override
  List<Object> get props => [
        id,
        authorName,
        authorAvatar,
        newsId,
        parentId,
        content,
        children,
        likeTotal,
        isLiked,
        createdAt
      ];

  @override
  String toString() {
    return 'NewsComment{id: $id, authorName: $authorName, authorAvatar: $authorAvatar, newsId: $newsId, parentId: $parentId, content: $content, children: $children, likeTotal: $likeTotal, isLiked: $isLiked, createdAt: $createdAt}';
  }
}
