import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'barrel_entity.dart';

part 'app_config_data.g.dart';

@JsonSerializable()
class AppConfigData extends Equatable {
  @JsonKey(name: "base_url")
  String baseUrl;
  @JsonKey(name: "app_configs")
  AppConfig appConfigs;


  AppConfigData(this.baseUrl, this.appConfigs);

  factory AppConfigData.fromJson(Map<String, dynamic> json) =>
      _$AppConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigDataToJson(this);

  @override
  List<Object> get props => [baseUrl, appConfigs];

  @override
  String toString() {
    return 'AppConfigData{baseUrl: $baseUrl, appConfigs: $appConfigs}';
  }
}
