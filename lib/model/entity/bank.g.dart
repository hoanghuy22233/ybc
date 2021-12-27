// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
    json['id'] as int,
    json['bank_name'] as String,
    json['image'] as String,
    json['branch'] as String,
    json['account_number'] as String,
  );
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'bank_name': instance.bankName,
      'image': instance.image,
      'branch': instance.branch,
      'account_number': instance.accountNumber,
    };
