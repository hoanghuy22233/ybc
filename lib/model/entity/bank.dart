import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank extends Equatable {
  int id;
  @JsonKey(name: "bank_name")
  String bankName;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "branch")
  String branch;
  @JsonKey(name: "account_number")
  String accountNumber;


  Bank(this.id, this.bankName, this.image, this.branch, this.accountNumber);

  factory Bank.fromJson(Map<String, dynamic> json) =>
      _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);

  @override
  List<Object> get props => [
    id,
   bankName,image,branch,accountNumber
  ];

  @override
  String toString() {
    return 'Bank{id: $id, bankName: $bankName, image: $image, branch: $branch, accountNumber: $accountNumber}';
  }
}
