import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'transporter.g.dart';

@JsonSerializable()
class Transporter extends Equatable {
  int id;
  String name;
  String description;
  int price;


  Transporter(this.id, this.name, this.description, this.price);

  factory Transporter.fromJson(Map<String, dynamic> json) =>
      _$TransporterFromJson(json);

  Map<String, dynamic> toJson() => _$TransporterToJson(this);

  @override
  List<Object> get props => [
    id,
   name, description,price
  ];

  @override
  String toString() {
    return 'Transporter{id: $id, name: $name, description: $description, price: $price}';
  }
}
