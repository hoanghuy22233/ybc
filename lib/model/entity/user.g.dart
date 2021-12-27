// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['email'] as String,
    json['name'] as String,
    json['tel'] as String,
    json['address'] as String,
    json['image'] as String,
    json['gender'] as String,
    json['api_token'] as String,
    json['job'] as String,
    json['intro'] as String,
    json['birthday'] as String,
    json['role_display_name'] as String,
    json['role_name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'tel': instance.tel,
      'address': instance.address,
      'image': instance.image,
      'gender': instance.gender,
      'api_token': instance.apiToken,
      'job': instance.job,
      'intro': instance.intro,
      'birthday': instance.birthday,
      'role_display_name': instance.roleDisplayName,
      'role_name': instance.roleName,
    };
