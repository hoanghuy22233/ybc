// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    json['id'] as int,
    json['user_name'] as String,
    json['user_avatar'] as String,
    json['content'] as String,
    (json['number_star'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'user_avatar': instance.userAvatar,
      'content': instance.content,
      'number_star': instance.numberStar,
    };
