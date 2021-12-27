// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseNotification _$FirebaseNotificationFromJson(Map json) {
  return FirebaseNotification(
    json['notification'] == null
        ? null
        : Notification.fromJson((json['notification'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['data'] == null
        ? null
        : Data.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FirebaseNotificationToJson(
        FirebaseNotification instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'data': instance.data,
    };
