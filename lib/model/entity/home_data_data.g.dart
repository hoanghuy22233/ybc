// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataData _$HomeDataDataFromJson(Map<String, dynamic> json) {
  return HomeDataData(
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : HomeData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeDataDataToJson(HomeDataData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
