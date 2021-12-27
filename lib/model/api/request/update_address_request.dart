import 'package:json_annotation/json_annotation.dart';

part 'update_address_request.g.dart';

@JsonSerializable()
class UpdateAddressRequest {
  @JsonKey(name: "address")
  final String address;

  UpdateAddressRequest({
    this.address,
  });

  factory  UpdateAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAddressRequestToJson(this);
}
