// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetail _$CategoryDetailFromJson(Map<String, dynamic> json) {
  return CategoryDetail(
    json['current_page'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : PostDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['first_page_url'] as String,
    json['from'] as int,
    json['last_page'] as int,
    json['last_page_url'] as String,
    json['next_page_url'] as String,
    json['path'] as String,
    json['per_page'] as int,
    json['prev_page_url'] as String,
    json['to'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$CategoryDetailToJson(CategoryDetail instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
