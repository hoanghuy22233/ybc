import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/base_response.dart';
import 'package:ybc/model/entity/cart.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse extends BaseResponse {
  List<Cart> data;

  CartResponse(this.data);

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);

}
