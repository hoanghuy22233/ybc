// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thought _$ThoughtFromJson(Map<String, dynamic> json) {
  return Thought(
    content: json['content'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ThoughtToJson(Thought instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
    };
