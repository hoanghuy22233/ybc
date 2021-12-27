import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_address_response.g.dart';

@JsonSerializable()
class UpdateAddressResponse extends BaseResponse {
  UpdateAddressResponse();

  factory UpdateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAddressResponseToJson(this);
}
