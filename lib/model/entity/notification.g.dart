// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    json['id'] as int,
    json['title'] as String,
    json['content'] as String,
    json['type'] as int,
    json['type_id'] as int,
    json['read'] as int,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'type_id': instance.typeId,
      'read': instance.read,
      'created_at': instance.createdAt,
    };
