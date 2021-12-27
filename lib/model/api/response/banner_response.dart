import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/banner_data.dart';

import 'base_response.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse extends BaseResponse {
  BannerData data;

  BannerResponse(this.data);

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}
