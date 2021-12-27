// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_remove_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRemoveResponse _$CartRemoveResponseFromJson(Map<String, dynamic> json) {
  return CartRemoveResponse(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Cart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CartRemoveResponseToJson(CartRemoveResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
