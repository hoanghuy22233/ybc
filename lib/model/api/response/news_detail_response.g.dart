// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailResponse _$NewsDetailResponseFromJson(Map<String, dynamic> json) {
  return NewsDetailResponse(
    json['data'] == null
        ? null
        : NewsDetailData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as bool
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$NewsDetailResponseToJson(NewsDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
