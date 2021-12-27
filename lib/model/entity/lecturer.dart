import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecturer.g.dart';

@JsonSerializable()
class Lecturer extends Equatable {
  int id;
  String name;

  Lecturer(this.id, this.name);

  factory Lecturer.fromJson(Map<String, dynamic> json) =>
      _$LecturerFromJson(json);

  Map<String, dynamic> toJson() => _$LecturerToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
      ];

  @override
  String toString() {
    return 'Lecturer{id: $id, name: $name,}';
  }
}
