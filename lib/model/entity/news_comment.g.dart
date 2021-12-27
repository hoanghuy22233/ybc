// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsComment _$NewsCommentFromJson(Map<String, dynamic> json) {
  return NewsComment(
    json['id'] as int,
    json['author_name'] as String,
    json['author_avatar'] as String,
    json['news_id'] as int,
    json['parent_id'] as int,
    json['content'] as String,
    (json['children'] as List)
        ?.map((e) =>
            e == null ? null : NewsComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['like_total'] as int,
    json['is_liked'] as int,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$NewsCommentToJson(NewsComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_name': instance.authorName,
      'author_avatar': instance.authorAvatar,
      'news_id': instance.newsId,
      'parent_id': instance.parentId,
      'content': instance.content,
      'children': instance.children,
      'like_total': instance.likeTotal,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt,
    };
