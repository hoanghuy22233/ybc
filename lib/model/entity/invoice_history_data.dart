import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_history_data.g.dart';

@JsonSerializable()
class InvoiceHistoryData extends Equatable {
  List<Invoice> list;

  InvoiceHistoryData(this.list);

  factory InvoiceHistoryData.fromJson(Map<String, dynamic> json) =>
      _$InvoiceHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceHistoryDataToJson(this);

  @override
  List<Object> get props => [list];
}
