import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_data.g.dart';

@JsonSerializable()
class ProductDetailData extends Equatable {
  Product product;
  @JsonKey(name: "number_review_total")
  int numberReviewTotal;
  @JsonKey(name: "related_product")
  List<Product> relatedProduct;

  ProductDetailData(this.product, this.numberReviewTotal, this.relatedProduct);

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailDataToJson(this);

  @override
  List<Object> get props => [product, numberReviewTotal, relatedProduct];

  @override
  String toString() {
    return 'ProductDetailData{product: $product, numberReviewTotal: $numberReviewTotal, relatedProduct: $relatedProduct}';
  }
}
