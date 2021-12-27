// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigData _$AppConfigDataFromJson(Map<String, dynamic> json) {
  return AppConfigData(
    json['base_url'] as String,
    json['app_configs'] == null
        ? null
        : AppConfig.fromJson(json['app_configs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppConfigDataToJson(AppConfigData instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'app_configs': instance.appConfigs,
    };
