import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  int id;
  String email;
  String name;
  String tel;
  String address;
  String image;
  String gender;
  @JsonKey(name: "api_token")
  String apiToken;
  @JsonKey(name: "job")
  String job;
  @JsonKey(name: "intro")
  String intro;
  String birthday;
  @JsonKey(name: "role_display_name")
  String roleDisplayName;
  @JsonKey(name: "role_name")
  String roleName;


  User(
      this.id,
      this.email,
      this.name,
      this.tel,
      this.address,
      this.image,
      this.gender,
      this.apiToken,
      this.job,
      this.intro,
      this.birthday,
      this.roleDisplayName,
      this.roleName);

  // int status;
  // @JsonKey(name: "created_at")
  // String createdAt;
  // @JsonKey(name: "updated_at")
  // String updatedAt;
  //
  //
  // @JsonKey(name: "company_ids")
  // int companyIds;
  // @JsonKey(name: "last_company_id")
  // int lastCompanyId;

  //
  //
  //
  // @JsonKey(name: "change_password")
  // String changePassword;
  // @JsonKey(name: "admin_id")
  // int adminId;
  // @JsonKey(name: "facebook")
  // String facebook;
  // String skype;
  // String zalo;
  // String gmail;
  // @JsonKey(name: "password_md5")
  // String passwordMd5;
  // @JsonKey(name: "area1_start")
  // String area1Start;
  // @JsonKey(name: "area1_end")
  // String area1End;
  // @JsonKey(name: "area2_start")
  // String area2Start;
  // @JsonKey(name: "area2_end")
  // String area2End;
  // @JsonKey(name: "area3_start")
  // String area3Start;
  // @JsonKey(name: "area3_end")
  // String area3End;
  // @JsonKey(name: "day_of_week")
  // String dayOfWeek;
  // @JsonKey(name: "level")
  // String level;
  // @JsonKey(name: "intro")
  // String intro;
  // @JsonKey(name: "note")
  // String note;
  // @JsonKey(name: "invite_by")
  // String inviteBy;
  // @JsonKey(name: "short_name")
  // String shortName;
  // @JsonKey(name: "province_id")
  // int provinceId;
  // @JsonKey(name: "district_id")
  // int districtId;
  // @JsonKey(name: "ward_id")
  // int wardId;
  // @JsonKey(name: "job")
  // String job;
  // @JsonKey(name: "supply_chains")
  // String supplyChains;



  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, tel: $tel, address: $address, image: $image, gender: $gender, birthday: $birthday, apiToken: $apiToken,job: $job, intro: $intro, gender: $roleDisplayName, birthday: $roleName,}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
    id,
    email,
    image,
    tel,
    name,
    apiToken,
    address,
    gender,
    job,
    intro,
    birthday,
    roleDisplayName,
    roleName
      ];
}
