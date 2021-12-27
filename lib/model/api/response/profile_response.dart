import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/user.dart';

import 'base_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse extends BaseResponse {
  User data;

  ProfileResponse(this.data);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  @override
  String toString() {
    return 'ProfileResponse{data: $data}';
  }
}
