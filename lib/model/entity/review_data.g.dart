// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) {
  return ReviewData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Review.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
