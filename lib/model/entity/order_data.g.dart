// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
    (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..totalRecord = json['total_record'] as int;
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'rows': instance.rows,
      'total_record': instance.totalRecord,
    };
