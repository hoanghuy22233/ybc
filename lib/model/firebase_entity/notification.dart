import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  String title;
  String body;

  Notification(
      this.title,
      this.body,
      );

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  List<Object> get props => [
    title,
    body,
  ];

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}