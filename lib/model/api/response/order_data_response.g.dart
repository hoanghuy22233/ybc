// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDataResponse _$OrderDataResponseFromJson(Map<String, dynamic> json) {
  return OrderDataResponse(
    json['data'] == null
        ? null
        : OrderData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$OrderDataResponseToJson(OrderDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
