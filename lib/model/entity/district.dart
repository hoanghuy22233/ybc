import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'district.g.dart';

@JsonSerializable()
class District extends Equatable {
  int id;
  String name;


  District(this.id, this.name);

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object> get props => [id, name,];

  @override
  String toString() {
    return 'District{id: $id, name: $name}';
  }
}
