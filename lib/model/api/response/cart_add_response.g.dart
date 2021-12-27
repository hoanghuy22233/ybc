// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartAddResponse _$CartAddResponseFromJson(Map<String, dynamic> json) {
  return CartAddResponse(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Cart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$CartAddResponseToJson(CartAddResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
