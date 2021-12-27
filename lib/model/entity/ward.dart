import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'ward.g.dart';

@JsonSerializable()
class Ward extends Equatable {
  int id;
  String name;


  Ward(this.id, this.name);

  factory Ward.fromJson(Map<String, dynamic> json) =>
      _$WardFromJson(json);

  Map<String, dynamic> toJson() => _$WardToJson(this);

  @override
  List<Object> get props => [id, name,];

  @override
  String toString() {
    return 'Ward{id: $id, name: $name}';
  }
}
