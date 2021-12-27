import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/base_response.dart';
import 'package:ybc/model/entity/cart.dart';

part 'cart_add_response.g.dart';

@JsonSerializable()
class CartAddResponse extends BaseResponse {
  List<Cart> data;

  CartAddResponse(this.data);

  factory CartAddResponse.fromJson(Map<String, dynamic> json) =>
      _$CartAddResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartAddResponseToJson(this);

}
