import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: "type_id")
  String typeId;
  String body;
  String type;
  String title;

  Data(this.typeId, this.body, this.type, this.title);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object> get props => [typeId, body, type, title];

  @override
  String toString(){
    return '''{"type_id": "${this.typeId}", "body": "${this.body}", "type": "${this.type}", "title": "${this.title}"}''';
  }
}
