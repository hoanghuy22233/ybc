// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    id: json['id'] as int,
    name: json['name'] as String,
    intro: json['intro'] as String,
    image: json['image'] as String,
    link: json['link'] as String,
    homeTop: json['location'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'intro': instance.intro,
      'image': instance.image,
      'link': instance.link,
      'location': instance.homeTop,
      'status': instance.status,
    };
