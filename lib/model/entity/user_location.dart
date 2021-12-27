import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_location.g.dart';

@JsonSerializable()
class UserLocation extends Equatable {
  int id;
  String name;
  String lat;
  String long;
  String avatar;

  UserLocation(
      this.id,
      this.name,
      this.lat,
      this.long,
      this.avatar,
      );

  @override
  String toString() {
    return 'User{id: $id, name: $name, lat: $lat, long: $long, avatar: $avatar}';
  }

  factory UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    lat,
    long,
    avatar
  ];
}
