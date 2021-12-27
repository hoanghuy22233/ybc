import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'voucher.g.dart';

@JsonSerializable()
class Voucher extends Equatable {
  int id;
  String name;
  String image;
  @JsonKey(name: "detail_voucher")
  String detailVoucher;
  double point;
  int type;
  @JsonKey(name: "percent_off")
  double percentOff;
  @JsonKey(name: "sale_price")
  int salePrice;
  @JsonKey(name: "max_sale_price")
  int maxSalePrice;

  @JsonKey(name: "invoice_total")
  double invoiceTotal;
  @JsonKey(name: "expires_at")
  String expiresAt;
  int index;

  Voucher(
      this.id,
      this.name,
      this.image,
      this.detailVoucher,
      this.point,
      this.type,
      this.percentOff,
      this.salePrice,
      this.maxSalePrice,
      this.invoiceTotal,
      this.expiresAt);

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
        detailVoucher,
        point,
        type,
        percentOff,
        salePrice,
        maxSalePrice,
        invoiceTotal,
        expiresAt,
    index
      ];

  @override
  String toString() {
    return 'Voucher{id: $id, name: $name, image: $image, detailVoucher: $detailVoucher, point: $point, type: $type, percentOff: $percentOff, salePrice: $salePrice, maxSalePrice: $maxSalePrice, invoiceTotal: $invoiceTotal, expiresAt: $expiresAt}';
  }
}
