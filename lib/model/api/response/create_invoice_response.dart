import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'create_invoice_response.g.dart';

@JsonSerializable()
class CreateInvoiceResponse extends BaseResponse {
  CreateInvoiceResponse();

  factory CreateInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceResponseToJson(this);
}
