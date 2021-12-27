// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategories _$MenuCategoriesFromJson(Map<String, dynamic> json) {
  return MenuCategories(
    json['category_id'] as int,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$MenuCategoriesToJson(MenuCategories instance) =>
    <String, dynamic>{
      'category_id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
