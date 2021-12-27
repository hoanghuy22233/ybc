import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_data.g.dart';

@JsonSerializable()
class SearchData extends Equatable {
  List<Search> rows;
  @JsonKey(name: "records_total")
  int recordsTotal;

  SearchData(this.rows, this.recordsTotal);

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);

  @override
  List<Object> get props => [rows, recordsTotal];
}
