import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/order_item.dart';

part 'order_data.g.dart';

@JsonSerializable()
class OrderData extends Equatable {
  List<OrderItem> rows;

  @JsonKey(name: "total_record")
  int totalRecord;

  OrderData(this.rows);

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);

  @override
  List<Object> get props => [rows];
}
