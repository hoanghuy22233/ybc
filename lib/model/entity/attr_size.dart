import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'attr_size.g.dart';

@JsonSerializable()
class AttrSize extends Equatable {
  int id;
  String name;

  AttrSize({this.id, this.name});

  factory AttrSize.fromJson(Map<String, dynamic> json) => _$AttrSizeFromJson(json);

  Map<String, dynamic> toJson() => _$AttrSizeToJson(this);

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'AttrSize{id: $id, name: $name}';
  }
}
