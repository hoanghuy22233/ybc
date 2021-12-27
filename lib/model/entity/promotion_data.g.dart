// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionData _$PromotionDataFromJson(Map<String, dynamic> json) {
  return PromotionData(
    (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : Promotion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PromotionDataToJson(PromotionData instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
