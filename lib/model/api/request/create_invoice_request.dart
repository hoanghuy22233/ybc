import 'package:json_annotation/json_annotation.dart';

part 'create_invoice_request.g.dart';

@JsonSerializable()
class CreateInvoiceRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "city_id")
  final int cityId;
  @JsonKey(name: "district_id")
  final int districtId;
  @JsonKey(name: "ward_id")
  final int wardId;
  @JsonKey(name: "tel")
  final String tel;
  @JsonKey(name: "payment_type")
  final int paymentType;
  @JsonKey(name: "api_token")
  final String apiToken;

  CreateInvoiceRequest(this.name, this.email, this.address, this.cityId,
      this.districtId, this.wardId, this.tel, this.paymentType, this.apiToken);

  @override
  String toString() {
    return 'CreateInvoiceRequest{name: $name, email: $email, address: $address, cityId: $cityId, districtId: $districtId, paymentType: $paymentType, wardId: $wardId, paymentType: $paymentType, tel: $tel, apiToken: $apiToken}';
  }

  factory CreateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceRequestToJson(this);
}
