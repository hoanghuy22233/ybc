// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLocationRequest _$UpdateLocationRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateLocationRequest(
    json['api_token'] as String,
    json['lat'] as String,
    json['long'] as String,
  );
}

Map<String, dynamic> _$UpdateLocationRequestToJson(
        UpdateLocationRequest instance) =>
    <String, dynamic>{
      'api_token': instance.apiToken,
      'lat': instance.lat,
      'long': instance.long,
    };
