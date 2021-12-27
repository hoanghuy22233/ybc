// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartAddRequest _$CartAddRequestFromJson(Map<String, dynamic> json) {
  return CartAddRequest(
    json['course_id'] as int,
    json['api_token'] as String,
  );
}

Map<String, dynamic> _$CartAddRequestToJson(CartAddRequest instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'api_token': instance.apiToken,
    };
