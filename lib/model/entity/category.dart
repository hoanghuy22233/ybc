import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  int id;
  String name;
  String image;
  List<Category> child;

  Category(this.id, this.name, this.image, this.child);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object> get props => [id, name, image, child];

  @override
  String toString() {
    return 'Category{id: $id, name: $name, image: $image, child: $child}';
  }
}
