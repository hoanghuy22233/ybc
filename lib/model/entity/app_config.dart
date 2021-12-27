import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'branch.dart';

part 'app_config.g.dart';

@JsonSerializable(explicitToJson: true)
class AppConfig extends Equatable {
  @JsonKey(name: "choose_size")
  String chooseSize;
  @JsonKey(name: "choose_style")
  String chooseStyle;
  String email;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(name: "use_of_terms")
  String useOfTerms;

  @JsonKey(name: "connect_fb")
  String connectFB;
  @JsonKey(name: "connect_instagam")
  String connectInsta;
  @JsonKey(name: "connect_web")
  String connectWeb;
  @JsonKey(name: "connect_youtube")
  String connectYoutube;
  @JsonKey(name: "image_banner")
  String imageBanner;
  @JsonKey(name: "logo")
  String logo;
  @JsonKey(name: "loyalty_policy")
  String loyaltyPolicy;
  @JsonKey(name: "return_the_goods")
  String returnTheGoods;
  List<Branch> branch;

  AppConfig(
      this.chooseSize,
      this.chooseStyle,
      this.email,
      this.phoneNumber,
      this.useOfTerms,
      this.connectFB,
      this.connectInsta,
      this.connectWeb,
      this.connectYoutube,
      this.imageBanner,
      this.logo,
      this.loyaltyPolicy,
      this.returnTheGoods,
      this.branch);

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  @override
  List<Object> get props => [
        chooseSize,
        chooseStyle,
        email,
        phoneNumber,
        useOfTerms,
        loyaltyPolicy,
        logo,
        connectWeb,
        connectWeb,
        connectInsta,
        connectFB,
        returnTheGoods,
        imageBanner,
        branch
      ];

  @override
  String toString() {
    return 'AppConfig{chooseSize: $chooseSize, chooseStyle: $chooseStyle, email: $email, phoneNumber: $phoneNumber, useOfTerms: $useOfTerms}';
  }
}
