import 'package:json_annotation/json_annotation.dart';

part 'cart_remove_request.g.dart';

@JsonSerializable()
class CartRemoveRequest {
  @JsonKey(name: "cart_id")
  final int cartId ;
  @JsonKey(name: "api_token")
    final String apiToken ;

  CartRemoveRequest(this.cartId, this.apiToken);

  factory CartRemoveRequest.fromJson(Map<String, dynamic> json) =>
      _$CartRemoveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartRemoveRequestToJson(this);
}
