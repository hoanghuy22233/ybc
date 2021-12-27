// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThoughtResponse _$ThoughtResponseFromJson(Map<String, dynamic> json) {
  return ThoughtResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Thought.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$ThoughtResponseToJson(ThoughtResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
