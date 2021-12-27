import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'promotion.g.dart';

@JsonSerializable()
class Promotion extends Equatable {
  int id;
  @JsonKey(name: "percent_off")
  double percentOff;
  @JsonKey(name: "is_use_with_voucher")
  int isUseWithVoucher;

  @JsonKey(name: "invoice_total")
  int invoiceTotal;
  @JsonKey(name: "max_sale")
  int maxSale;
  @JsonKey(name: "start_date")
  String startDate;
  @JsonKey(name: "end_date")
  String endDate;

  Promotion(this.id, this.percentOff, this.isUseWithVoucher, this.invoiceTotal,
      this.maxSale, this.startDate, this.endDate);

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionToJson(this);

  @override
  List<Object> get props => [
        id,
        percentOff,
        isUseWithVoucher,
        invoiceTotal,
        maxSale,
        startDate,
        endDate
      ];

  @override
  String toString() {
    return 'Promotion{id: $id, percentOff: $percentOff, isUseWithVoucher: $isUseWithVoucher, invoiceTotal: $invoiceTotal, maxSale: $maxSale, startDate: $startDate, endDate: $endDate}';
  }
}
