import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

part 'login_register_data.g.dart';

@JsonSerializable()
class LoginRegisterData extends Equatable {
  User data;

  LoginRegisterData({this.data});

  factory LoginRegisterData.fromJson(Map<String, dynamic> json) =>
      _$LoginRegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRegisterDataToJson(this);

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'LoginRegisterData{ user: $data}';
  }
}
