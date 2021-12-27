import 'package:ybc/model/api/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/cart.dart';

part 'cart_remove_response.g.dart';

@JsonSerializable()
class CartRemoveResponse extends BaseResponse {
  List<Cart> data;

  CartRemoveResponse(this.data);

  factory CartRemoveResponse.fromJson(Map<String, dynamic> json) =>
      _$CartRemoveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartRemoveResponseToJson(this);

}
