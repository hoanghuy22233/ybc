import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  int id;
  @JsonKey(name: "receiver_name")
  String receiverName;
  @JsonKey(name: "receiver_phone")
  String receiverPhone;
  @JsonKey(name: "province_name")
  String provinceName;
  @JsonKey(name: "district_name")
  String districtName;
  @JsonKey(name: "ward_name")
  String wardName;
  @JsonKey(name: "province_id")
  String provinceId;
  @JsonKey(name: "district_id")
  String districtId;
  @JsonKey(name: "ward_id")
  String wardId;
  String address;
  int type;

  Address(
      this.id,
      this.receiverName,
      this.receiverPhone,
      this.provinceName,
      this.districtName,
      this.wardName,
      this.provinceId,
      this.districtId,
      this.wardId,
      this.address,
      this.type);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object> get props => [
        id,
        receiverName,
        receiverPhone,
        provinceName,
        districtName,
        wardName,
        provinceId,
        districtId,
        wardId,
        address,
        type
      ];

  String getFullAddress() {
    String fullAddress = address + ", " + (districtName??"") + ", " + (wardName??"") + ", " + (provinceName??"");
    return fullAddress;
  }

  @override
  String toString() {
    return 'Address{id: $id, receiverName: $receiverName, receiverPhone: $receiverPhone, provinceName: $provinceName, districtName: $districtName, wardName: $wardName, provinceId: $provinceId, districtId: $districtId, wardId: $wardId, address: $address, type: $type}';
  }
}
