import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice extends Equatable {
  int id;
  @JsonKey(name: "invoice_code")
  String invoiceCode;
  @JsonKey(name: "receiver_name")
  String receiverName;
  @JsonKey(name: "receiver_phone")
  String receiverPhone;
  @JsonKey(name: "full_address")
  String fullAddress;
  @JsonKey(name: "voucher_name")
  String voucherName;
  @JsonKey(name: "voucher_price")
  int voucherPrice;
  @JsonKey(name: "promotion_name")
  String promotionName;
  @JsonKey(name: "promotion_price")
  int promotionPrice;
  @JsonKey(name: "percent_off_price")
  int percentOffPrice;
  @JsonKey(name: "transport_name")
  String transportName;
  @JsonKey(name: "transport_price")
  int transportPrice;
  @JsonKey(name: "payment_type")
  int paymentType;
  @JsonKey(name: "payment_status")
  int paymentStatus;
  int status;
  int total;
  @JsonKey(name: "delivery_time")
  String deliveryTime;
  String note;
  List<ProductOrder> products;

  Invoice(
      this.id,
      this.invoiceCode,
      this.receiverName,
      this.receiverPhone,
      this.fullAddress,
      this.voucherName,
      this.voucherPrice,
      this.promotionName,
      this.promotionPrice,
      this.percentOffPrice,
      this.transportName,
      this.transportPrice,
      this.paymentType,
      this.paymentStatus,
      this.status,
      this.total,
      this.deliveryTime,
      this.note,
      this.products);

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);

  @override
  List<Object> get props => [
        id,
        invoiceCode,
        receiverName,
        receiverPhone,
        fullAddress,
        voucherName,
        voucherPrice,
        promotionName,
        promotionPrice,
        percentOffPrice,
        transportName,
        transportPrice,
        paymentType,
        paymentStatus,
        status,
        total,
        deliveryTime,
        note,
        products
      ];

  @override
  String toString() {
    return 'Invoice{id: $id, invoiceCode: $invoiceCode, receiverName: $receiverName, receiverPhone: $receiverPhone, fullAddress: $fullAddress, voucherName: $voucherName, voucherPrice: $voucherPrice, promotionName: $promotionName, promotionPrice: $promotionPrice, percentOffPrice: $percentOffPrice, transportName: $transportName, transportPrice: $transportPrice, paymentType: $paymentType, paymentStatus: $paymentStatus, status: $status, total: $total, deliveryTime: $deliveryTime, note: $note, products: $products}';
  }

  int getTotalPayment() {
    return total + transportPrice - voucherPrice - promotionPrice;
  }
}
