//import 'package:json_annotation/json_annotation.dart';
//import 'package:equatable/equatable.dart';
//
//part 'news.g.dart';
//
//@JsonSerializable()
//class RelatedProduct extends Equatable {
//  int id;
//  String name;
//  @JsonKey(name: "product_code")
//  String product_code;
//  int price;
//  @JsonKey(name: "sale_price")
//  int salePrice;
//  @JsonKey(name: "qty")
//  int qty;
//  @JsonKey(name: "is_sale")
//  int isSale;
//  @JsonKey(name: "is_attr")
//  int isAttr;
//  @JsonKey(name: "percent_off")
//  int percent_off;
//  List<String> image;
//  @JsonKey(name: "detail_product")
//  String detailProduct;
//  @JsonKey(name: "percent_off")
//  int percent_off;
//  @JsonKey(name: "percent_off")
//  int percent_off;
//
//  RelatedProduct(
//      this.id,
//      this.title,
//      this.description,
//      this.content,
//      this.type,
//      this.videoLink,
//      this.image,
//      this.percentOff,
//      this.isUseWithVoucher,
//      this.invoiceTotal,
//      this.maxSale,
//      this.startDate,
//      this.endDate,
//      this.createdAt);
//
//  factory RelatedProduct.fromJson(Map<String, dynamic> json) =>
//      _$RelatedProductFromJson(json);
//
//  Map<String, dynamic> toJson() => _$RelatedProductToJson(this);
//
//  @override
//  List<Object> get props => [
//        id,
//        title,
//        description,
//        content,
//        type,
//        videoLink,
//        image,
//        percentOff,
//        isUseWithVoucher,
//        invoiceTotal,
//        maxSale,
//        startDate,
//        endDate,
//        createdAt
//      ];
//
//  @override
//  String toString() {
//    return 'RelatedProduct{id: $id, title: $title, description: $description, content: $content, type: $type, videoLink: $videoLink, image: $image, percentOff: $percentOff, isUseWithVoucher: $isUseWithVoucher, invoiceTotal: $invoiceTotal, maxSale: $maxSale, startDate: $startDate, endDate: $endDate, createdAt: $createdAt}';
//  }
//}
