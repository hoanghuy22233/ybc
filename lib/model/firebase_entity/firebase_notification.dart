import 'package:ybc/model/firebase_entity/barrel_firebase_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_notification.g.dart';

@JsonSerializable(anyMap: true)
class FirebaseNotification extends Equatable {
  Notification notification;
  Data data;

  FirebaseNotification(
    this.notification,
    this.data,
  );

  factory FirebaseNotification.fromJson(Map<String, dynamic> json) =>
      _$FirebaseNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseNotificationToJson(this);

  @override
  List<Object> get props => [
        notification,
        data,
      ];

  @override
  String toString() {
    return 'FirebaseNotification{notification: $notification, data: $data}';
  }
}
