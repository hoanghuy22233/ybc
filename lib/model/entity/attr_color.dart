import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'attr_color.g.dart';

@JsonSerializable()
class AttrColor extends Equatable {
  int id;
  String name;
  @JsonKey(name: "color_code")
  String colorCode;

  AttrColor({this.id, this.name, this.colorCode});

  factory AttrColor.fromJson(Map<String, dynamic> json) => _$AttrColorFromJson(json);

  Map<String, dynamic> toJson() => _$AttrColorToJson(this);

  @override
  List<Object> get props => [id, name,colorCode];

  @override
  String toString() {
    return 'AttrColor{id: $id, name: $name, colorCode: $colorCode}';
  }
}
