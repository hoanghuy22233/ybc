// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortRequest _$SortRequestFromJson(Map<String, dynamic> json) {
  return SortRequest(
    json['name'] as String,
    json['create'] as String,
  );
}

Map<String, dynamic> _$SortRequestToJson(SortRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'create': instance.create,
    };
