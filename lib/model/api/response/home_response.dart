import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/base_response.dart';
import 'package:ybc/model/entity/home_data_data.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  HomeDataData data;

  HomeResponse({this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
