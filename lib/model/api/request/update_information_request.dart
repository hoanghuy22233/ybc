import 'package:json_annotation/json_annotation.dart';

part 'update_information_request.g.dart';

@JsonSerializable()
class UpdateInformationRequest {
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "birthday")
  final String birthday;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "intro")
  final String intro;
  @JsonKey(name: "job")
  final String job;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "tel")
  final String tel;
  @JsonKey(name: "gender")
  final int gender;


  UpdateInformationRequest({this.address, this.birthday, this.email, this.intro,
      this.job, this.name, this.tel, this.gender});

  factory  UpdateInformationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInformationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInformationRequestToJson(this);
}
