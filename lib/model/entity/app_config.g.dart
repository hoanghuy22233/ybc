// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig(
    json['choose_size'] as String,
    json['choose_style'] as String,
    json['email'] as String,
    json['phone_number'] as String,
    json['use_of_terms'] as String,
    json['connect_fb'] as String,
    json['connect_instagam'] as String,
    json['connect_web'] as String,
    json['connect_youtube'] as String,
    json['image_banner'] as String,
    json['logo'] as String,
    json['loyalty_policy'] as String,
    json['return_the_goods'] as String,
    (json['branch'] as List)
        ?.map((e) =>
            e == null ? null : Branch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'choose_size': instance.chooseSize,
      'choose_style': instance.chooseStyle,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'use_of_terms': instance.useOfTerms,
      'connect_fb': instance.connectFB,
      'connect_instagam': instance.connectInsta,
      'connect_web': instance.connectWeb,
      'connect_youtube': instance.connectYoutube,
      'image_banner': instance.imageBanner,
      'logo': instance.logo,
      'loyalty_policy': instance.loyaltyPolicy,
      'return_the_goods': instance.returnTheGoods,
      'branch': instance.branch?.map((e) => e?.toJson())?.toList(),
    };
