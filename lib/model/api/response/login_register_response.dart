import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

part 'login_register_response.g.dart';

@JsonSerializable()
class LoginRegisterResponse extends BaseResponse {
  User data;

  LoginRegisterResponse(this.data);

  factory LoginRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRegisterResponseToJson(this);

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'LoginRegisterResponse{data: $data}';
  }
}
