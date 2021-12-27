// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortGroupRequest _$SortGroupRequestFromJson(Map<String, dynamic> json) {
  return SortGroupRequest(
    json['sorts'] == null
        ? null
        : SortRequest.fromJson(json['sorts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SortGroupRequestToJson(SortGroupRequest instance) =>
    <String, dynamic>{
      'sorts': instance.sorts,
    };
