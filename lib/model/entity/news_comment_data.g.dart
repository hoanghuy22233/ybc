// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsCommentData _$NewsCommentDataFromJson(Map<String, dynamic> json) {
  return NewsCommentData(
    (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : NewsComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsCommentDataToJson(NewsCommentData instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
