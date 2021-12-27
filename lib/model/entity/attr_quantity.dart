import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'attr_quantity.g.dart';

@JsonSerializable()
class AttrQuantity extends Equatable {
  @JsonKey(name: "size_id")
  int sizeId;
  @JsonKey(name: "size_name")
  String sizeName;
  @JsonKey(name: "color_id")
  int colorId;
  @JsonKey(name: "color_name")
  String colorName;
  int quantity;

  AttrQuantity(
      this.sizeId, this.sizeName, this.colorId, this.colorName, this.quantity);

  factory AttrQuantity.fromJson(Map<String, dynamic> json) =>
      _$AttrQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$AttrQuantityToJson(this);

  @override
  List<Object> get props => [sizeId, sizeName, colorId, colorName, quantity];

  @override
  String toString() {
    return 'AttrQuantity{sizeId: $sizeId, sizeName: $sizeName, colorId: $colorId, colorName: $colorName, quantity: $quantity}';
  }
}
