import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'province.g.dart';

@JsonSerializable()
class Province extends Equatable {
  int id;
  String name;


  Province(this.id, this.name);

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  @override
  List<Object> get props => [id, name,];

  @override
  String toString() {
    return 'Province{id: $id, name: $name}';
  }
}
