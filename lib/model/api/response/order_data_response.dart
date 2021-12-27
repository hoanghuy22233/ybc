import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/order_data.dart';
import 'package:ybc/model/entity/user.dart';

import 'base_response.dart';

part 'order_data_response.g.dart';

@JsonSerializable()
class OrderDataResponse extends BaseResponse {
  OrderData data;

  OrderDataResponse(this.data);

  factory OrderDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataResponseToJson(this);

  @override
  String toString() {
    return 'OrderDataResponse{data: $data}';
  }
}
