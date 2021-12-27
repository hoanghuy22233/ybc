// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_remove_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRemoveRequest _$CartRemoveRequestFromJson(Map<String, dynamic> json) {
  return CartRemoveRequest(
    json['cart_id'] as int,
    json['api_token'] as String,
  );
}

Map<String, dynamic> _$CartRemoveRequestToJson(CartRemoveRequest instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'api_token': instance.apiToken,
    };
