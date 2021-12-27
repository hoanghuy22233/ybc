import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_courser.g.dart';

@JsonSerializable()
class CategoryCourser extends Equatable {
  int id;
  String name;
  String image;

  CategoryCourser(
    this.id,
    this.name,
    this.image,
  );

  factory CategoryCourser.fromJson(Map<String, dynamic> json) =>
      _$CategoryCourserFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryCourserToJson(this);

  @override
  List<Object> get props => [id, name, image];

  @override
  String toString() {
    return 'CategoryCourser{id: $id, name: $name, image: $image}';
  }
}
