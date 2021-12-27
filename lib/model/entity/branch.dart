
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch extends Equatable{
  String address;
  String phone;

  Branch(
      this.address,
      this.phone);

  factory Branch.fromJson(Map<String, dynamic> json) =>
      _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);

  @override
  List<Object> get props => [phone, address];

  @override
  String toString() {
    return 'Branch{address: $address, phone: $phone}';
  }
}
