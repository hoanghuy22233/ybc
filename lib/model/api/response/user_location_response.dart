import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/user.dart';
import 'package:ybc/model/entity/user_location.dart';

import 'base_response.dart';

part 'user_location_response.g.dart';

@JsonSerializable()
class UserLocationResponse extends BaseResponse {
  List<UserLocation> data;

  UserLocationResponse(this.data);

  factory UserLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationResponseToJson(this);

  @override
  String toString() {
    return 'UserLocationResponse{data: $data}';
  }
}
