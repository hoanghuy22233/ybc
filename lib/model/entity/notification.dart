import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  int id;
  String title;
  String content;
  int type;
  @JsonKey(name: "type_id")
  int typeId;
  int read;
  @JsonKey(name: "created_at")
  String createdAt;

  Notification(this.id, this.title, this.content, this.type, this.typeId,
      this.read, this.createdAt);

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  List<Object> get props => [id, title, content, type, typeId, read, createdAt];

  @override
  String toString() {
    return 'Notification{id: $id, title: $title, content: $content, type: $type, typeId: $typeId, read: $read, createdAt: $createdAt}';
  }
}
