import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_menu.g.dart';

@JsonSerializable()
class MenuCategories extends Equatable {
  @JsonKey(name: "category_id")
  int id;
  String name;
  String image;

  MenuCategories(
    this.id,
    this.name,
    this.image,
  );

  factory MenuCategories.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoriesToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
      ];

  @override
  String toString() {
    return 'Category{id: $id, name: $name, image: $image,}';
  }
}
